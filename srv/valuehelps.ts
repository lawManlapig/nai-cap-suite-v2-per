import cds from "@sap/cds";
import {
  CompanyCodeVH,
  CurrencyVH,
  CostCenterVH,
  BusinessPartnerVH,
  SCIMUsersVH,
} from "#cds-models/S4ValueHelpService";
export class S4ValueHelpService extends cds.ApplicationService {
  async init() {
    const s4ValueHelp = await cds.connect.to("S4ValueHelp");
    this.on(
      "READ",
      [CompanyCodeVH, CurrencyVH, CostCenterVH, BusinessPartnerVH],
      (req: any) => {
        return s4ValueHelp.run(req.query);
      },
    );
    this.on("READ", SCIMUsersVH, async () => {
      //initialize mapping of SCIM groups to SCIM groups entity
      const btpIAM = await cds.connect.to("Identity.Authentication.API");
      if (!btpIAM) {
        throw new Error("Cannot connect to SCIM service");
      }

      const scimUsers: any = await btpIAM.send({
        method: "GET",
        path: "/Users",
        headers: {
          Accept: "application/scim+json",
          "Content-Type": "application/scim+json",
        },
      });

      const allUsers = scimUsers?.Resources.map((u: any) => ({
        userName: u.userName,
        displayName: u.displayName,
        email: u.email,
      }));
      return allUsers;
    });
    return super.init();
  }
}
