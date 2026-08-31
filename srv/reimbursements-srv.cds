using {rb} from '../db/schema';
using {S4ValueHelp} from '../srv/external/S4ValueHelp';

@path: '/cap-suite/reimbursements'
service ExpenseRequestsService {
    @odata.draft.enabled
    entity ExpenseRequests              as projection on rb.ExpenseRequests;

    entity ExpenseList                  as projection on rb.ExpenseList;

    // Value Help (OData)
    entity BusinessPartnerVH            as projection on S4ValueHelp.BusinessPartnerBasic;
    entity CompanyCodeVH                as projection on S4ValueHelp.CompanyCode;
    entity CurrencyVH                   as projection on S4ValueHelp.Currency;
    entity CostCenterVH                 as projection on S4ValueHelp.CostCenter;

    // Value Help  (Local)
    entity ReimbursementRequestTypes    as projection on rb.RequestTypes;
    entity ReimbursementSubRequestTypes as projection on rb.SubRequestTypes;
}
