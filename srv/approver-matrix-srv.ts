import cds from "@sap/cds";
import {
  ReimbursementsMatrix,
  SCIMUsers,
  CompanyCodeVH,
  GetReimbursementsApprovers,
  InitiateCAPSuiteWorkflow,
  TriggerApplicationWorkflow,
} from "#cds-models/ApproverMatrixService";
import { ReimbursementsApproverMatrix as ReimbursementsAMController } from "./controllers/am-reimbursements";
import { ICAPSuitePayload, TCAPSuiteContext } from "./types/types";

export default class ApproverMatrix extends cds.ApplicationService {
  async init(): Promise<void> {
    const btpIAM = await cds.connect.to("Identity.Authentication.API");
    const s4ValueHelp = await cds.connect.to("S4ValueHelp");
    const bpa = await cds.connect.to("Workflow");

    this.before("NEW", "ReimbursementsMatrix.drafts", async (req: any) => {
      debugger;
      console.log("Before creating new ReimbursementsMatrix entry: ", req.data);

      // const rawData = JSON.parse(req.req._raw);
      // if (!rawData) {
      //   return req.error(
      //     400,
      //     "Invalid request data. Please provide valid data to create a new entry.",
      //   );
      // }
      const scimGroup: any = await btpIAM.send({
        method: "GET",
        path: "/Groups",
        headers: {
          Accept: "application/scim+json",
          "Content-Type": "application/scim+json",
        },
      });

      const IsGroupExisting = scimGroup?.Resources?.some(
        (g: any) => g.displayName === req.data.approverGroup,
      );
      if (IsGroupExisting) {
        return req.error(400, "APPROVER_GROUP_ALREADY_EXISTS", {
          approverGroup: req.data.approverGroup,
        });
      }
      const IsPositionExisting = await SELECT.one
        .from(ReimbursementsMatrix)
        .columns("position")
        .where({ position: req.data.position });
      if (IsPositionExisting) {
        return req.error(400, "POSITION_ALREADY_EXISTS", {
          position: req.data.position,
        });
      }
      const { uuid } = cds.utils;
      req.data.ID = uuid();
    });
    this.on("READ", CompanyCodeVH, (req: any) => {
      return s4ValueHelp.run(req.query);
    });

    this.on("READ", SCIMUsers, async (req: any) => {
      try {
        // Get the approverGroup
        const approverGroup: any = (
          await SELECT.one
            .from(ReimbursementsMatrix)
            .columns("approverGroup")
            .where({ ID: req.params[0].ID })
        )?.approverGroup;

        if (!approverGroup) {
          return;
        }
        const scimUsers: any = await btpIAM.send({
          method: "GET",
          path: "/Users",
          headers: {
            Accept: "application/scim+json",
            "Content-Type": "application/scim+json",
          },
        });

        if (scimUsers?.Resources.length <= 0) {
          throw new Error("No SCIM users found");
        }
        // Filter users based on approverGroup
        const userGroups = scimUsers.Resources.filter((u: any) =>
          u.groups?.some((g: any) => g.display === approverGroup),
        );

        console.log("Filtered Users: ", userGroups);

        const allUsers: SCIMUsers[] = userGroups.map((user: any) => ({
          ID: user.id,
          userName: user.userName,
          displayName: user.displayName,
          email: user.emails?.[0]?.value || "",
        }));

        return allUsers;
      } catch (error: any) {
        console.error(error);
        req.error(500, error.message || "Internal Server Error");
      }
    });

    this.on("CREATE", SCIMUsers, async (req: any) => {
      // Add any post-create logic here, such as logging or triggering other processes
      debugger;
      //get group
      const approverGroup: string = JSON.parse(req.req._raw)?._groups_ID;
      if (!approverGroup) {
        return req.error(400, "APPROVER_GROUP_MISSING_BUG", {
          approverGroup: approverGroup,
        });
      }
      const reimbursementsMatrix = new ReimbursementsAMController();

      try {
        await reimbursementsMatrix.AssignUserToGroup(
          approverGroup,
          req.data.userName,
          btpIAM,
        );
      } catch (error: any) {
        console.error(error);
        req.error(error.code, error.message || "Internal Server Error");
      }
    });

    this.on("DELETE", SCIMUsers, async (req: any) => {
      // Remove user from group in BTP IAM
      debugger;
      console.log(req);
    });

    this.after("DELETE", ReimbursementsMatrix, async (req: any) => {
      debugger;
      console.log(req);
    });

    this.after("CREATE", "ReimbursementsMatrix", async (req: any) => {
      debugger;
      // Add any post-create logic here, such as logging or triggering other processes

      await btpIAM.send({
        method: "POST",
        path: "/Groups",
        headers: {
          Accept: "application/scim+json",
          "Content-Type": "application/scim+json",
        },
        data: {
          displayName: req.approverGroup,
          id: req.ID,
          schemas: ["urn:ietf:params:scim:schemas:core:2.0:Group"],
        },
      });
    });

    //CAP Functions/Actions
    this.on(GetReimbursementsApprovers, async (req: any) => {
      const { position } = req.params[0] || req.data;

      const allApproverLevels = await SELECT.from(ReimbursementsMatrix)
        .columns("*")
        .where({ position })
        .orderBy("approverLevel");

      if (!allApproverLevels || allApproverLevels.length === 0) {
        return req.error(404, "NO_APPROVER_FOUND_FOR_POSITION", {
          position: position,
        });
      }
      return allApproverLevels;
    });

    this.on(InitiateCAPSuiteWorkflow, async (req: any) => {
      const { applicationId, data } = req.params[0] || req.data;

      if (!applicationId || !data) {
        return req.error(400, "INVALID_BPA_REQUEST", {
          applicationId: applicationId,
          data: data,
        });
      }

      if (!bpa) {
        return req.error(500, "BPA_SERVICE_CONNECTION_FAILED");
      }

      const bpaContext: TCAPSuiteContext = {
        applicationId,
        data,
      };
      const bpaPayload: ICAPSuitePayload = {
        definitionId: process.env.CAP_SUITE_BPA_DEFINITION_ID || "",
        context: bpaContext,
      };
      try {
        await bpa.send({
          method: "POST",
          path: process.env.SAP_BTP_BPA_ENVIRONMENT_ID + "",
          headers: {
            Accept: "application/json",
            "Content-Type": "application/json",
            "irpa-api-key": process.env.SAP_BTP_BPA_IRPA_KEY + "",
          },
          data: bpaPayload,
        });
      } catch (error: any) {
        console.error("Error initiating workflow: ", error);
        return req.error(500, "BPA_SERVICE_CONNECTION_FAILED");
      }
    });

    this.on(TriggerApplicationWorkflow, async (req: any) => {
      const bpaPayload: any = {
        definitionId: req.data.definitionId || req.params[0]?.definitionId,
        context: req.data.data || req.params[0]?.data,
      };

      try {
        await bpa.send({
          method: "POST",
          path: process.env.SAP_BTP_BPA_ENVIRONMENT_ID + "",
          headers: {
            Accept: "application/json",
            "Content-Type": "application/json",
            "irpa-api-key": process.env.SAP_BTP_BPA_IRPA_KEY + "",
          },
          data: bpaPayload,
        });
      } catch (error: any) {
        console.error("Error initiating workflow: ", error);
        return req.error(500, "BPA_SERVICE_CONNECTION_FAILED");
      }
    });
    return super.init();
  }
}
