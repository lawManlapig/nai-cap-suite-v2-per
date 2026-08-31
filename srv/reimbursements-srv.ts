import cds from "@sap/cds";
import { ExpenseRequests } from "#cds-models/ExpenseRequestsService";
import { getDatePeriodAndYear } from "./helpers/reimbursements-helpers";

export class ExpenseRequestsService extends cds.ApplicationService {
  async init() {
    const s4ValueHelp = await cds.connect.to("S4ValueHelp");

    // Value Help from S4
    this.on(
      "READ",
      ["CompanyCodeVH", "CurrencyVH", "CostCenterVH", "BusinessPartnerVH"],
      (req) => {
        return s4ValueHelp.run(req.query);
      },
    );

    // Initial Values
    this.before("CREATE", ExpenseRequests.drafts, async (req) => {
      req.data.period = getDatePeriodAndYear().period;
      req.data.year = getDatePeriodAndYear().year;
    });

    // Side Effects Logic
    this.before("UPDATE", ExpenseRequests.drafts, async (req) => {
      const draftData = await SELECT.from(ExpenseRequests.drafts).where({
        ID: req.data.ID,
      });

      // Update Payload
      let payload = {
        DraftAdministrativeData_DraftUUID:
          draftData[0].DraftAdministrativeData_DraftUUID,
        ID: req.data.ID,
        period: req.data.dateFiled != null
          ? req.data.dateFiled.substring(5, 7)
          : null,
        year: req.data.dateFiled
          ? req.data.dateFiled.substring(0, 4)
          : null,
      };

      await UPDATE(ExpenseRequests.drafts).set(payload).where({
        ID: req.data.ID,
        DraftAdministrativeData_DraftUUID:
          draftData[0].DraftAdministrativeData_DraftUUID,
      });
    });

    // Saving
    this.before("CREATE", ExpenseRequests, async (req) => {
      const requestTypeCode: string = req.data.requestType_code ?? ""; // I doubt this will turn "" since request type code is mandatory

      // Get latest Request ID
      const latestEntry = await SELECT.from(ExpenseRequests)
        .columns("max(requestID) as requestID")
        .where(`requestType_code like '${requestTypeCode}%'`);

      let latestRequestID: string = latestEntry[0].requestID ?? "";

      // Add 1 to the latest request ID for the same request type
      if (latestRequestID !== "") {
        let nextRequestIDNumber =
          parseInt(latestRequestID.replace(requestTypeCode, "")) + 1;

        req.data.requestID =
          requestTypeCode + nextRequestIDNumber.toString().padStart(8, "0");
      } else {
        // New Entry
        req.data.requestID = requestTypeCode + "00000001";
      }
    });

    // Custom Actions
    this.on("submitEntry", ExpenseRequests, async (req) => {});

    return super.init();
  }
}
