namespace ca;
using { cvh } from './custom-vh';
//========================================
// ca - Custom Aspects Namespace
//========================================

// Reusable
// @assert.unique: {main: [
//     companyCode,
//     department
// ]}

@assert.unique: {main: [
    approverGroup
]}
aspect ApproveMatrix {
    companyCode   : cvh.CompanyCode @(title: '{i18n>cocd}', mandatory, readonly);
    department    : cvh.DepartmentCode @(title: '{i18n>dept}', mandatory, readonly);
    approverGroup : String(30) @(title: '{i18n>agrp}', mandatory, readonly);
}

// Billing
// entity BillingApprovers : ApproveMatrix {
//     category      : String @mandatory;
//     amountMinimum : Integer;
//     amountMaximum : Integer;
// }

// Supplier Accreditation and Onboarding
// entity SCAMatrix : ApproveMatrix {
//     category : String(2) @mandatory;
// }

// Business Partner
// @assert.unique: {main: [
//     action,
//     fpgmc
// ]}
// entity BusinessPartnerApprovers : cuid, managed {
//     action         : String;
//     fpgmc          : String;
//     approverNumber : Integer;
//     approverGroup  : String @mandatory;
// }
