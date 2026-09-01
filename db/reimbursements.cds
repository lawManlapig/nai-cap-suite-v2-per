using {
    cuid,
    managed
} from '@sap/cds/common';
using {vh} from './schema';
using {S4ValueHelp} from '../srv/external/S4ValueHelp';
using {cvh} from './custom-vh';

namespace rb;

//========================================
// rb - Reimbursements Namespace
//========================================

entity ExpenseRequests : cuid, managed {
    // Header Details
    requestID                 : String(10) default '$Temporary'                        @title: '{i18n>rqid}';
    employeeID                : Association to S4ValueHelp.BusinessPartnerBasic        @title: '{i18n>empid}';
    employeeName              : String(80)                                             @UI.Hidden;
    companyCode               : Association to S4ValueHelp.CompanyCode                 @title: '{i18n>cocd}';
    companyCodeText           : String                                                 @UI.Hidden;
    currency                  : Association to S4ValueHelp.Currency default 'PHP'      @title: '{i18n>curr}';
    currencyText              : String                                                 @UI.Hidden;
    requestType               : Association to vh.ReimbursementRequestTypes default '' @title: '{i18n>rqtyp}' @mandatory;
    requestTypeDescription    : String                                                 @UI.Hidden;
    subRequestType            : Association to vh.ReimbursementSubRequestTypes         @title: '{i18n>srqty}' @mandatory;
    subRequestTypeDescription : String                                                 @UI.Hidden;
    dateFiled                 : Date default $now                                      @title: '{i18n>dtfld}';
    period                    : String(2)                                              @title: '{i18n>perio}';
    year                      : String(4)                                              @title: '{i18n>year}';
    remarks                   : String                                                 @title: '{i18n>remar}';
    reference                 : String                                                 @title: '{i18n>refer}' @mandatory;
    department                : cvh.DepartmentCode                                     @title: '{i18n>dept}';
    costCenter                : Association to S4ValueHelp.CostCenter                  @title: '{i18n>coce}';
    costCenterText            : String                                                 @UI.Hidden;
    area                      : String                                                 @title: '{i18n>area}';
    expenseList               : Composition of many ExpenseList
                                    on expenseList.header = $self;
}

// Child Entity
entity ExpenseList : cuid {
    header            : Association to ExpenseRequests;
    transactionDate   : Date                  @title: '{i18n>tdat}';
    productionRelated : Boolean default false @title: '{i18n>prdrl}';
    expenseType       : String                @title: '{i18n>extyp}';
    particulars       : String                @title: '{i18n>parti}';
    establishment     : String                @title: '{i18n>estab}';
    address           : String                @title: '{i18n>addrs}';
    tin               : String                @title: '{i18n>tinum}';
    invoiceNumber     : String                @title: '{i18n>invnm}';
    mileageFrom       : Date                  @title: '{i18n>milfr}';
    mileageTo         : Date                  @title: '{i18n>milto}';
    department        : String                @title: '{i18n>dept}';
    costCenter        : String                @title: '{i18n>coce}';
    internalOrder     : String                @title: '{i18n>intor}';
    withVat           : Boolean default false @title: '{i18n>wvat}';
    grossAmount       : Decimal(19, 2)        @title: '{i18n>gramt}';
    netAmount         : Decimal(19, 2)        @title: '{i18n>ntamt}';
    vatAmount         : Decimal(19, 2)        @title: '{i18n>vtamt}';
    vatCode           : String                @title: '{i18n>vtcod}'; // Need CDS from S4 (VAT)
    whtClassification : String                @title: '{i18n>wclss}'; // Need CDS from S4 (Withholding Tax)
    withinSixtyDays   : Boolean default false @title: '{i18n>win60}';
    departureDate     : Date                  @title: '{i18n>depdt}';
    returnDate        : Date                  @title: '{i18n>retdt}';
    dateNeeded        : Date                  @title: '{i18n>neddt}';
}
