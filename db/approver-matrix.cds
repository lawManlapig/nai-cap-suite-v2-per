using {
    cuid,
    managed,
} from '@sap/cds/common';
namespace am;

//========================================
// am - Approver Matrix Namespace
//========================================

entity ReimbursementsAM : cuid, managed {
   key position: String(50) @mandatory @title: '{i18n>pos}'; // Position of the requestor
   key approverGroup : String(30) @(title: '{i18n>agrp}', mandatory); //Approver group
   approverType : ApproverType @mandatory @title: '{i18n>appty}'; // Sales or NonSales
   approverLevel : Integer @mandatory @title: '{i18n>applv}'; // 1, 2, 3 etc.
   amountQuota : Decimal(15,2) @title: '{i18n>amtqt}'; // Amount quota for the approver group   
   _members: Association to many SCIMUsers on _members._groups = $self @title: '{i18n>membr}';
}

@cds.persistence.skip
entity SCIMUsers {

    key ID: UUID @readonly;
    key userName : String(100) @(title: '{i18n>usrnm}', readonly);
    displayName : String(100) @(title: '{i18n>dspnm}', readonly);
    email : String(255) @(title: '{i18n>email}', readonly);
    title: String(255) @(title: '{i18n>title}', readonly);
    _groups : Association to ReimbursementsAM @(title: '{i18n>group}', readonly);
}

type ApproverType : String enum {
    Sales = 'SA' @title: '{i18n>sales}';
    NonSales = 'NS' @title: '{i18n>nslsa}';
}

