using { am } from '../db/approver-matrix';
using { S4ValueHelp } from './external/S4ValueHelp';
using { cvh as CustomValueHelp } from '../db/custom-vh';

@path: '/cap-suite/approvers'
service ApproverMatrixService {
    entity ReimbursementsMatrix as projection on am.ReimbursementsAM;
    // entity IAMGroups as projection on am.SCIMGroups;
    entity SCIMUsers as projection on am.SCIMUsers;
    
    //Value Helps
    entity CompanyCodeVH as projection on S4ValueHelp.CompanyCode;
    entity DepartmentVH as projection on CustomValueHelp.Department;

    //CAP Functions
    function GetReimbursementsApprovers(position: String(50)) returns array of ReimbursementsMatrix;
    action InitiateCAPSuiteWorkflow(applicationId: String(50), data: LargeString);
    action TriggerApplicationWorkflow(definitionId: String(50), data: LargeString);
}