    
 using {S4ValueHelp} from '../srv/external/S4ValueHelp';
 using { cvh as CustomVH } from '../db/custom-vh';
 using {vh} from '../db/views';
 @path: '/cap-suite/vh'
 service S4ValueHelpService {
    // Value Help (OData)
    entity CompanyCodeVH                as projection on S4ValueHelp.CompanyCode;
    entity CurrencyVH                   as projection on S4ValueHelp.Currency;
    entity CostCenterVH                 as projection on S4ValueHelp.CostCenter;
    entity BusinessPartnerVH            as projection on S4ValueHelp.BusinessPartnerBasic;
    entity DepartmentVH                 as projection on CustomVH.Department;
    // entity ReimbursementApproversVH     as projection on vh.ReimbursementApprovers; 
    entity SCIMUsersVH                  as projection on vh.SCIMUsersVH
}