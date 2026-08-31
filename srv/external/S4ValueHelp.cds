/* checksum : 25c6db81b13d80eb6a7e0a6f562e3a3c */
@cds.external : true
@CodeList.CurrencyCodes.Url : '../../../../default/iwbep/common/0001;o=LOCAL/$metadata'
@CodeList.CurrencyCodes.CollectionPath : 'Currencies'
@Aggregation.ApplySupported.Transformations : [ 'aggregate', 'groupby', 'filter' ]
@Aggregation.ApplySupported.Rollup : #None
@Common.ApplyMultiUnitBehaviorForSortingAndFiltering : true
@Capabilities.FilterFunctions : [
  'eq',
  'ne',
  'gt',
  'ge',
  'lt',
  'le',
  'and',
  'or',
  'contains',
  'startswith',
  'endswith',
  'any',
  'all'
]
@Capabilities.SupportedFormats : [ 'application/json', 'application/pdf' ]
@PDF.Features.DocumentDescriptionReference : '../../../../default/iwbep/common/0001/$metadata'
@PDF.Features.DocumentDescriptionCollection : 'MyDocumentDescriptions'
@PDF.Features.ArchiveFormat : true
@PDF.Features.Border : true
@PDF.Features.CoverPage : true
@PDF.Features.FitToPage : true
@PDF.Features.FontName : true
@PDF.Features.FontSize : true
@PDF.Features.Margin : true
@PDF.Features.Padding : true
@PDF.Features.Signature : true
@PDF.Features.HeaderFooter : true
@PDF.Features.ResultSizeDefault : 20000
@PDF.Features.ResultSizeMaximum : 20000
@Capabilities.KeyAsSegmentSupported : true
@Capabilities.AsynchronousRequestsSupported : true
service S4ValueHelp {
  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Business Partner'
  @UI.LineItem : [
    {
      $Type: 'SAP__UI.DataField',
      Value: BusinessPartner,
      @UI.Importance: #High
    },
    {
      $Type: 'SAP__UI.DataField',
      Value: FormOfAddressName,
      @UI.Importance: #High
    },
    {
      $Type: 'SAP__UI.DataField',
      Value: BusinessPartnerName,
      @UI.Importance: #High
    },
    {
      $Type: 'SAP__UI.DataField',
      Value: BusinessPartnerCategory,
      @UI.Importance: #High
    },
    {
      $Type: 'SAP__UI.DataField',
      Value: BusinessPartnerIDByExtSystem,
      @UI.Importance: #High
    },
    { $Type: 'SAP__UI.DataField', Value: FirstName, @UI.Importance: #High },
    { $Type: 'SAP__UI.DataField', Value: LastName, @UI.Importance: #High },
    {
      $Type: 'SAP__UI.DataField',
      Value: OrganizationBPName1,
      @UI.Importance: #High
    },
    {
      $Type: 'SAP__UI.DataField',
      Value: GroupBusinessPartnerName1,
      @UI.Importance: #High
    },
    { $Type: 'SAP__UI.DataField', Value: BirthDate, @UI.Importance: #High }
  ]
  @Capabilities.SearchRestrictions.Searchable : true
  @Capabilities.SearchRestrictions.UnsupportedExpressions : #phrase
  @Capabilities.InsertRestrictions.Insertable : false
  @Capabilities.DeleteRestrictions.Deletable : false
  @Capabilities.UpdateRestrictions.Updatable : false
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  entity BusinessPartnerBasic {
    @Common.Text : BusinessPartnerName
    @Common.IsUpperCase : true
    @Common.Label : 'Business Partner'
    @Common.QuickInfo : 'Business Partner Number'
    key BusinessPartner : String(10) not null;
    @Common.IsUpperCase : true
    @UI.Hidden : true
    @Common.Label : 'Title Key'
    @Common.Heading : 'Key'
    @Common.QuickInfo : 'Form-of-Address Key'
    FormOfAddress : String(4) not null;
    @Common.Label : 'Title'
    @Common.QuickInfo : 'Title'
    @Common.Heading : 'Title'
    FormOfAddressName : String(30) not null;
    @Common.Label : 'Business Partner Name'
    @UI.HiddenFilter : true
    BusinessPartnerName : String(81) not null;
    @Common.Label : 'Business Partner Category'
    @Common.IsUpperCase : true
    @Common.Heading : 'BPC'
    @Common.QuickInfo : 'Business Partner Category'
    BusinessPartnerCategory : String(1) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'External BP Number'
    @Common.QuickInfo : 'Business Partner Number in External System'
    BusinessPartnerIDByExtSystem : String(20) not null;
    @Common.Label : 'First Name'
    @Common.Heading : 'First Name'
    @Common.QuickInfo : 'First Name of Business Partner (Person)'
    FirstName : String(40) not null;
    @Common.Label : 'Last Name'
    @Common.Heading : 'Last Name'
    @Common.QuickInfo : 'Last Name of Business Partner (Person)'
    LastName : String(40) not null;
    @Common.Label : 'Organization Name 1'
    @Common.Heading : 'Name 1'
    @Common.QuickInfo : 'Name 1 of organization'
    OrganizationBPName1 : String(40) not null;
    @Common.Label : 'Group Name 1'
    @Common.Heading : 'Name 1'
    @Common.QuickInfo : 'Name 1 (group)'
    GroupBusinessPartnerName1 : String(40) not null;
    @Common.Label : 'Date of Birth'
    @Common.Heading : 'Birth Date'
    @Common.QuickInfo : 'Date of Birth of Business Partner'
    BirthDate : Date;
    @Common.IsUpperCase : true
    @UI.Hidden : true
    @Common.Label : 'Authorization Group'
    @Common.Heading : 'AGrp'
    AuthorizationGroup : String(4) not null;
    @Common.IsUpperCase : true
    @UI.Hidden : true
    @Common.Label : 'Purpose Completed'
    @Common.Heading : 'Business Purpose Completed Flag'
    @Common.QuickInfo : 'Business Purpose Completed Flag'
    IsBusinessPurposeCompleted : String(1) not null;
    @Common.IsUpperCase : true
    @UI.Hidden : true
    @Common.Label : 'Data Ctrlr. Set'
    @Common.Heading : 'Data Controller Set Flag'
    @Common.QuickInfo : 'BP: Data Controller Set Flag'
    DataControllerSet : String(1) not null;
    @Common.IsUpperCase : true
    @UI.Hidden : true
    @Common.Label : 'Data Controller'
    @Common.QuickInfo : 'BP: Data Controller (Internal Use Only)'
    DataController1 : String(30) not null;
    @Common.IsUpperCase : true
    @UI.Hidden : true
    @Common.Label : 'Data Controller'
    @Common.QuickInfo : 'BP: Data Controller (Internal Use Only)'
    DataController2 : String(30) not null;
    @Common.IsUpperCase : true
    @UI.Hidden : true
    @Common.Label : 'Data Controller'
    @Common.QuickInfo : 'BP: Data Controller (Internal Use Only)'
    DataController3 : String(30) not null;
    @Common.IsUpperCase : true
    @UI.Hidden : true
    @Common.Label : 'Data Controller'
    @Common.QuickInfo : 'BP: Data Controller (Internal Use Only)'
    DataController4 : String(30) not null;
    @Common.IsUpperCase : true
    @UI.Hidden : true
    @Common.Label : 'Data Controller'
    @Common.QuickInfo : 'BP: Data Controller (Internal Use Only)'
    DataController5 : String(30) not null;
    @Common.IsUpperCase : true
    @UI.Hidden : true
    @Common.Label : 'Data Controller'
    @Common.QuickInfo : 'BP: Data Controller (Internal Use Only)'
    DataController6 : String(30) not null;
    @Common.IsUpperCase : true
    @UI.Hidden : true
    @Common.Label : 'Data Controller'
    @Common.QuickInfo : 'BP: Data Controller (Internal Use Only)'
    DataController7 : String(30) not null;
    @Common.IsUpperCase : true
    @UI.Hidden : true
    @Common.Label : 'Data Controller'
    @Common.QuickInfo : 'BP: Data Controller (Internal Use Only)'
    DataController8 : String(30) not null;
    @Common.IsUpperCase : true
    @UI.Hidden : true
    @Common.Label : 'Data Controller'
    @Common.QuickInfo : 'BP: Data Controller (Internal Use Only)'
    DataController9 : String(30) not null;
    @Common.IsUpperCase : true
    @UI.Hidden : true
    @Common.Label : 'Data Controller'
    @Common.QuickInfo : 'BP: Data Controller (Internal Use Only)'
    DataController10 : String(30) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Business Partner Role'
  @Capabilities.SearchRestrictions.Searchable : true
  @Capabilities.SearchRestrictions.UnsupportedExpressions : #phrase
  @Capabilities.InsertRestrictions.Insertable : false
  @Capabilities.DeleteRestrictions.Deletable : false
  @Capabilities.UpdateRestrictions.Updatable : false
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  entity BusinessPartnerRole {
    @Common.Text : BusinessPartnerRole_Text
    @Common.IsUpperCase : true
    @Common.Label : 'BP Role'
    key BusinessPartnerRole : String(6) not null;
    @Common.Label : 'Role Description'
    @Core.Computed : true
    @Common.Heading : 'Title'
    @Common.QuickInfo : 'BP Role Title'
    BusinessPartnerRole_Text : String(25) not null;
    @Common.IsUpperCase : true
    @UI.Hidden : true
    @Common.Label : 'BP Role Category'
    @Common.Heading : 'BP Role Cat.'
    RoleCategory : String(6) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Business Partner Types'
  @Common.SAPObjectNodeType.Name : 'BusinessPartnerType'
  @Capabilities.SearchRestrictions.Searchable : false
  @Capabilities.InsertRestrictions.Insertable : false
  @Capabilities.DeleteRestrictions.Deletable : false
  @Capabilities.UpdateRestrictions.Updatable : false
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  entity BusinessPartnerType {
    @Common.Text : BusinessPartnerType_Text
    @Common.IsUpperCase : true
    @Common.Label : 'BP Type'
    @Common.Heading : 'Type'
    @Common.QuickInfo : 'Business Partner Type'
    key BusinessPartnerType : String(4) not null;
    @Common.Label : 'Business Partner Description'
    @Core.Computed : true
    @Common.Heading : 'Description'
    @Common.QuickInfo : 'Description'
    BusinessPartnerType_Text : String(40) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Company Code'
  @Capabilities.SearchRestrictions.Searchable : true
  @Capabilities.SearchRestrictions.UnsupportedExpressions : #phrase
  @Capabilities.InsertRestrictions.Insertable : false
  @Capabilities.DeleteRestrictions.Deletable : false
  @Capabilities.UpdateRestrictions.Updatable : false
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  entity CompanyCode {
    @Common.Text : CompanyCodeName
    @Common.IsUpperCase : true
    @Common.Label : 'Company Code'
    @Common.Heading : 'CoCd'
    key CompanyCode : String(4) not null;
    @Common.Label : 'Company Name'
    @Common.QuickInfo : 'Name of Company Code or Company'
    CompanyCodeName : String(25) not null;
    @Common.IsUpperCase : true
    @Common.ValueListReferences : [
      '../../../../srvd_f4/sap/i_controllingareastdvh/0001;ps=''srvd-zapi_cap_valuehelps_readonly-0001'';va=''com.sap.gateway.srvd.zapi_cap_valuehelps_readonly.v0001.et-i_companycodevh.controllingarea'';o=LOCAL/$metadata'
    ]
    @Common.Label : 'Controlling Area'
    @Common.Heading : 'COAr'
    ControllingArea : String(4) not null;
    @Common.Label : 'City'
    CityName : String(25) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Country/Region Key'
    @Common.Heading : 'C/R'
    Country : String(3) not null;
    @Common.IsCurrency : true
    @Common.IsUpperCase : true
    @Common.Label : 'Currency'
    @Common.Heading : 'Crcy'
    @Common.QuickInfo : 'Currency Key'
    Currency : String(5) not null;
    @Common.Label : 'Language Key'
    @Common.Heading : 'Language'
    Language : String(2) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Chart of Accounts'
    ChartOfAccounts : String(4) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Fiscal Year Variant'
    @Common.Heading : 'FV'
    FiscalYearVariant : String(2) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Company'
    @Common.Heading : 'Co.'
    Company : String(6) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Credit Control Area'
    @Common.Heading : 'CCAr'
    CreditControlArea : String(4) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Alternative Chart of Accounts'
    @Common.QuickInfo : 'Alternative Chart of Accounts for Country/Region'
    CountryChartOfAccounts : String(4) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'FM Area'
    @Common.Heading : 'FMA'
    @Common.QuickInfo : 'Financial Management Area'
    FinancialManagementArea : String(4) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Cost Center'
  @UI.LineItem : [
    { $Type: 'SAP__UI.DataField', Value: CostCenter, @UI.Importance: #High },
    {
      $Type: 'SAP__UI.DataField',
      Value: ControllingArea,
      @UI.Importance: #High
    }
  ]
  @Capabilities.SearchRestrictions.Searchable : true
  @Capabilities.SearchRestrictions.UnsupportedExpressions : #phrase
  @Capabilities.InsertRestrictions.Insertable : false
  @Capabilities.DeleteRestrictions.Deletable : false
  @Capabilities.UpdateRestrictions.Updatable : false
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  entity CostCenter {
    @Common.IsUpperCase : true
    @Common.Label : 'Controlling Area'
    @Common.Heading : 'COAr'
    key ControllingArea : String(4) not null;
    @Common.Text : CostCenter_Text
    @Common.IsUpperCase : true
    @Common.Label : 'Cost Center'
    @Common.Heading : 'Cost Ctr'
    key CostCenter : String(10) not null;
    @Core.Computed : true
    @Common.Label : 'Cost Center Name'
    CostCenter_Text : String(20) not null;
    @Common.Label : 'Valid To'
    @Common.Heading : 'to'
    @Common.QuickInfo : 'Valid To Date'
    key ValidityEndDate : Date not null;
    @Common.Label : 'Valid From'
    @Common.QuickInfo : 'Valid-From Date'
    ValidityStartDate : Date;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Currency'
  @Capabilities.SearchRestrictions.Searchable : true
  @Capabilities.SearchRestrictions.UnsupportedExpressions : #phrase
  @Capabilities.InsertRestrictions.Insertable : false
  @Capabilities.DeleteRestrictions.Deletable : false
  @Capabilities.UpdateRestrictions.Updatable : false
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  entity Currency {
    @Common.IsCurrency : true
    @Common.Text : Currency_Text
    @Common.IsUpperCase : true
    @Common.Label : 'Currency'
    @Common.Heading : 'Crcy'
    @Common.QuickInfo : 'Currency Key'
    key Currency : String(5) not null;
    @Core.Computed : true
    @Common.Label : 'Description'
    Currency_Text : String(40) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Customer Group Value Help'
  @Capabilities.SearchRestrictions.Searchable : true
  @Capabilities.SearchRestrictions.UnsupportedExpressions : #phrase
  @Capabilities.InsertRestrictions.Insertable : false
  @Capabilities.DeleteRestrictions.Deletable : false
  @Capabilities.UpdateRestrictions.Updatable : false
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  entity CustomerGroup {
    @Common.Text : CustomerGroup_Text
    @Common.IsUpperCase : true
    @Common.Label : 'Customer Group'
    @Common.Heading : 'CGrp'
    key CustomerGroup : String(2) not null;
    @Core.Computed : true
    @Common.Label : 'Name'
    CustomerGroup_Text : String(20) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Distribution Channel'
  @Common.SAPObjectNodeType.Name : 'DistributionChannel'
  @Capabilities.SearchRestrictions.Searchable : true
  @Capabilities.SearchRestrictions.UnsupportedExpressions : #phrase
  @Capabilities.FilterRestrictions.NonFilterableProperties : [ 'DistributionChannelOID' ]
  @Capabilities.SortRestrictions.NonSortableProperties : [ 'DistributionChannelOID' ]
  @Capabilities.InsertRestrictions.Insertable : false
  @Capabilities.DeleteRestrictions.Deletable : false
  @Capabilities.UpdateRestrictions.Updatable : false
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  entity DistributionChannel {
    @Common.Text : DistributionChannel_Text
    @Common.IsUpperCase : true
    @Common.Label : 'Distribution Channel'
    @Common.Heading : 'DChl'
    key DistributionChannel : String(2) not null;
    @Core.Computed : true
    @Common.Label : 'Distribution Channel Description'
    DistributionChannel_Text : String(20) not null;
    @Common.Label : 'Distr Channel OID'
    @Common.Heading : 'Distribution Channel OID'
    @Common.QuickInfo : 'Distribution Channel OID'
    DistributionChannelOID : String(128) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Division Value Help'
  @Capabilities.SearchRestrictions.Searchable : true
  @Capabilities.SearchRestrictions.UnsupportedExpressions : #phrase
  @Capabilities.InsertRestrictions.Insertable : false
  @Capabilities.DeleteRestrictions.Deletable : false
  @Capabilities.UpdateRestrictions.Updatable : false
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  entity Division {
    @Common.Text : Division_Text
    @Common.IsUpperCase : true
    @Common.Label : 'Division'
    @Common.Heading : 'Dv'
    key Division : String(2) not null;
    @Core.Computed : true
    @Common.Label : 'Division Description'
    Division_Text : String(20) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Email Address'
  @Capabilities.SearchRestrictions.Searchable : true
  @Capabilities.SearchRestrictions.UnsupportedExpressions : #phrase
  @Capabilities.InsertRestrictions.Insertable : false
  @Capabilities.DeleteRestrictions.Deletable : false
  @Capabilities.UpdateRestrictions.Updatable : false
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  @Capabilities.FilterRestrictions.FilterExpressionRestrictions : [ { Property: smtp_addr, AllowedExpressions: 'MultiValue' } ]
  entity EmailAddress {
    @Common.IsUpperCase : true
    @Common.Label : 'Address Number'
    @Common.Heading : 'Addr. No.'
    key Addrnumber : String(10) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Person Number'
    @Common.Heading : 'Person'
    key Persnumber : String(10) not null;
    @Common.Label : 'from'
    @Common.Heading : 'From'
    @Common.QuickInfo : 'Valid-from date - in current Release only 00010101 possible'
    key DateFrom : Date not null;
    @Common.IsDigitSequence : true
    @Common.Label : 'Sequence Number'
    @Common.Heading : 'ID'
    key Consnumber : String(3) not null;
    @Common.Label : 'E-Mail Address'
    smtp_addr : String(241) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Region'
  @Capabilities.SearchRestrictions.Searchable : true
  @Capabilities.SearchRestrictions.UnsupportedExpressions : #phrase
  @Capabilities.InsertRestrictions.Insertable : false
  @Capabilities.DeleteRestrictions.Deletable : false
  @Capabilities.UpdateRestrictions.Updatable : false
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  entity Region {
    @Common.IsUpperCase : true
    @Common.Label : 'Country/Region Key'
    @Common.Heading : 'C/R'
    key Country : String(3) not null;
    @Common.Text : Region_Text
    @Common.IsUpperCase : true
    @Common.Label : 'Region'
    @Common.Heading : 'Rg'
    @Common.QuickInfo : 'Region (State, Province, County)'
    key Region : String(3) not null;
    @Core.Computed : true
    @Common.Label : 'Description'
    Region_Text : String(20) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Additional Customer Group 1'
  @Common.SAPObjectNodeType.Name : 'AdditionalCustomerGroup1'
  @Capabilities.SearchRestrictions.Searchable : true
  @Capabilities.SearchRestrictions.UnsupportedExpressions : #phrase
  @Capabilities.InsertRestrictions.Insertable : false
  @Capabilities.DeleteRestrictions.Deletable : false
  @Capabilities.UpdateRestrictions.Updatable : false
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  entity RetailChannel {
    @Common.Text : AdditionalCustomerGroup1_Text
    @Common.IsUpperCase : true
    @Common.Label : 'Customer Group 1'
    @Common.Heading : 'Grp1'
    key AdditionalCustomerGroup1 : String(3) not null;
    @Core.Computed : true
    @Common.Label : 'Description'
    AdditionalCustomerGroup1_Text : String(20) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Additional Customer Group 2'
  @Common.SAPObjectNodeType.Name : 'AdditionalCustomerGroup2'
  @Capabilities.SearchRestrictions.Searchable : true
  @Capabilities.SearchRestrictions.UnsupportedExpressions : #phrase
  @Capabilities.InsertRestrictions.Insertable : false
  @Capabilities.DeleteRestrictions.Deletable : false
  @Capabilities.UpdateRestrictions.Updatable : false
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  entity RetailSubChannel {
    @Common.Text : AdditionalCustomerGroup2_Text
    @Common.IsUpperCase : true
    @Common.Label : 'Customer Group 2'
    @Common.Heading : 'Grp2'
    key AdditionalCustomerGroup2 : String(3) not null;
    @Core.Computed : true
    @Common.Label : 'Description'
    AdditionalCustomerGroup2_Text : String(20) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Sales District'
  @Common.SAPObjectNodeType.Name : 'SalesDistrict'
  @Capabilities.SearchRestrictions.Searchable : true
  @Capabilities.SearchRestrictions.UnsupportedExpressions : #phrase
  @Capabilities.InsertRestrictions.Insertable : false
  @Capabilities.DeleteRestrictions.Deletable : false
  @Capabilities.UpdateRestrictions.Updatable : false
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  entity SalesDistrict {
    @Common.Text : SalesDistrict_Text
    @Common.IsUpperCase : true
    @Common.Label : 'Sales District'
    @Common.Heading : 'SDst'
    key SalesDistrict : String(6) not null;
    @Core.Computed : true
    @Common.Label : 'District Name'
    @Common.QuickInfo : 'Name of the District'
    SalesDistrict_Text : String(20) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Sales Organization'
  @Common.SAPObjectNodeType.Name : 'SalesOrganization'
  @Capabilities.SearchRestrictions.Searchable : true
  @Capabilities.SearchRestrictions.UnsupportedExpressions : #phrase
  @Capabilities.InsertRestrictions.Insertable : false
  @Capabilities.DeleteRestrictions.Deletable : false
  @Capabilities.UpdateRestrictions.Updatable : false
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  entity SalesOrg {
    @Common.Text : SalesOrganization_Text
    @Common.IsUpperCase : true
    @Common.Label : 'Sales Organization'
    @Common.Heading : 'SOrg.'
    key SalesOrganization : String(4) not null;
    @Core.Computed : true
    @Common.Label : 'Sales Organization Description'
    SalesOrganization_Text : String(20) not null;
    @Common.IsCurrency : true
    @Common.IsUpperCase : true
    @Common.Label : 'Statistics Currency'
    @Common.Heading : 'Curr.'
    @Common.QuickInfo : 'Statistics currency'
    SalesOrganizationCurrency : String(5) not null;
    @Common.IsUpperCase : true
    @Common.ValueListReferences : [
      '../../../../srvd_f4/sap/i_companycodestdvh/0001;ps=''srvd-zapi_cap_valuehelps_readonly-0001'';va=''com.sap.gateway.srvd.zapi_cap_valuehelps_readonly.v0001.et-i_salesorganization.companycode'';o=LOCAL/$metadata'
    ]
    @Common.Label : 'Company Code'
    @Common.Heading : 'CoCd'
    @Common.QuickInfo : 'Company code of the sales organization'
    CompanyCode : String(4) not null;
    @Common.IsUpperCase : true
    @Common.ValueListReferences : [
      '../../../../srvd_f4/sap/i_customer_vh/0001;ps=''srvd-zapi_cap_valuehelps_readonly-0001'';va=''com.sap.gateway.srvd.zapi_cap_valuehelps_readonly.v0001.et-i_salesorganization.intercompanybillingcustomer'';o=LOCAL/$metadata'
    ]
    @Common.Label : 'Customer Interc. Bl.'
    @Common.Heading : 'CustInterC'
    @Common.QuickInfo : 'Customer Number for Intercompany Billing'
    IntercompanyBillingCustomer : String(10) not null;
    @Common.IsUpperCase : true
    @UI.HiddenFilter : true
    @Common.Label : 'Address'
    AddressID : String(10) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'VAT ID Determination'
    @Common.Heading : 'VAT ID Determ.'
    @Common.QuickInfo : 'Rule that determines the VAT registration number (VAT ID)'
    xDF5xVATDetermination : String(1) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Business User - Value Help'
  @UI.PresentationVariant.SortOrder : [
    {
      $Type: 'SAP__common.SortOrderType',
      Property: LastName,
      Descending: false
    },
    {
      $Type: 'SAP__common.SortOrderType',
      Property: FirstName,
      Descending: false
    }
  ]
  @Capabilities.SearchRestrictions.Searchable : true
  @Capabilities.SearchRestrictions.UnsupportedExpressions : #phrase
  @Capabilities.InsertRestrictions.Insertable : false
  @Capabilities.DeleteRestrictions.Deletable : false
  @Capabilities.UpdateRestrictions.Updatable : false
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  @Capabilities.FilterRestrictions.FilterExpressionRestrictions : [ { Property: DefaultEmailAddress, AllowedExpressions: 'MultiValue' } ]
  entity User {
    @Common.Label : 'Person ID'
    @Common.Text : PersonFullName
    @Common.IsUpperCase : true
    @Common.Heading : 'Business Partner'
    @Common.QuickInfo : 'Business Partner Number'
    key BusinessPartner : String(10) not null;
    @Common.Label : 'Person External ID'
    @Common.IsUpperCase : true
    @Common.Heading : 'Identification Number'
    @Common.QuickInfo : 'Identification Number'
    BPIdentificationNumber : String(60) not null;
    @Common.Label : 'User ID'
    @Common.Text : PersonFullName
    @Common.IsUpperCase : true
    @Common.QuickInfo : 'User ID'
    UserID : String(12) not null;
    @Common.Label : 'First Name'
    @Common.Heading : 'First Name'
    @Common.QuickInfo : 'First Name of Business Partner (Person)'
    FirstName : String(40) not null;
    @Common.Label : 'Last Name'
    @Common.Heading : 'Last Name'
    @Common.QuickInfo : 'Last Name of Business Partner (Person)'
    LastName : String(40) not null;
    @Common.Label : 'Email Address'
    @Common.Heading : 'E-Mail Address'
    @Common.QuickInfo : 'E-Mail Address'
    DefaultEmailAddress : String(241) not null;
    @Common.Label : 'Full Name'
    @Common.Heading : 'Description of the Technical User Account'
    @Common.QuickInfo : 'Description of the Technical User Account'
    PersonFullName : String(80) not null;
    @Common.Label : 'Building'
    @UI.HiddenFilter : true
    @Common.Heading : 'Buildings'
    @Common.QuickInfo : 'Building (number or code)'
    Building : String(10) not null;
    @Common.Label : 'Room Number'
    @UI.HiddenFilter : true
    @Common.Heading : 'Room No.'
    @Common.QuickInfo : 'Room or Apartment Number'
    RoomNumber : String(10) not null;
    @Common.Label : 'Department'
    @UI.HiddenFilter : true
    @Common.Heading : 'Department'
    @Common.QuickInfo : 'Department'
    Department : String(40) not null;
    @Common.IsUpperCase : true
    @UI.Hidden : true
    @Common.Label : 'Purpose Completed'
    @Common.Heading : 'Business Purpose Completed Flag'
    @Common.QuickInfo : 'Business Purpose Completed Flag'
    IsBusinessPurposeCompleted : String(1) not null;
    @Common.IsUpperCase : true
    @UI.Hidden : true
    @Common.Label : 'Authorization Group'
    @Common.Heading : 'AGrp'
    AuthorizationGroup : String(4) not null;
  };
};

