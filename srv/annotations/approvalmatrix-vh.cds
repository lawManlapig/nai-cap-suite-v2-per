using { ApproverMatrixService as srv } from '../approver-matrix-srv';

// annotate srv.ReimbursementsMatrix with {
//     companyCode @(
//         Common.ValueList               : {
//             $Type         : 'Common.ValueListType',
//             CollectionPath: 'CompanyCodeVH',
//             Parameters    : [
//                 {
//                     $Type            : 'Common.ValueListParameterInOut',
//                     LocalDataProperty: companyCode,
//                     ValueListProperty: 'CompanyCode',
//                 },
//                 {
//                     $Type            : 'Common.ValueListParameterDisplayOnly',
//                     ValueListProperty: 'CompanyCodeName',
//                 },
//             ],
//         },
//     );
//     department @(
//         Common.ValueList               : {
//             $Type         : 'Common.ValueListType',
//             CollectionPath: 'DepartmentVH',
//             Parameters    : [
//                 {
//                     $Type            : 'Common.ValueListParameterInOut',
//                     LocalDataProperty: code,
//                     ValueListProperty: 'code',
//                 },
//                 {
//                     $Type            : 'Common.ValueListParameterDisplayOnly',
//                     ValueListProperty: 'name',
//                 },
//             ],
//         },
//     );    
// }