using {dm} from './schema';
using { am } from './approver-matrix';
namespace vh;

view CustomerTypes as
    select from dm.ConstantsHeader {
        key items.code,
            items.description
    }
    where
        code = 'CustomerTypes';

view ReconciliationGL as
    select from dm.ConstantsHeader {
        key items.code,
            items.description
    }
    where
        code = 'ReconciliationGL';

view ReimbursementRequestTypes as
    select from dm.ConstantsHeader {
        key items.code,
            items.description
    }
    where
        code = 'ReimbursementRequestTypes';

view ReimbursementSubRequestTypes as
    select from dm.ConstantsHeader {
        key items.code,
            items.description
    }
    where
        code = 'ReimbursementSubRequestTypes';

// view ReimbursementApprovers as
//     select from am.ReimbursementsAM {
//         key companyCode,
//             department,
//             approverGroup,
//             approverType
//     }
view SCIMUsersVH as 
    select from am.SCIMUsers {
        key userName,
            displayName,
            email
    }
