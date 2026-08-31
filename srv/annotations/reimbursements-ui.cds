using ExpenseRequestsService as srv from '../../srv/reimbursements-srv';

annotate srv.ExpenseRequests with @(

    // Header Information
    UI.HeaderInfo                    : {
        TypeName      : '{i18n>rq}',
        TypeNamePlural: '{i18n>rq}s',
        Title         : {Value: '{requestTypeDescription} - {requestID}'},
        Description   : {Value: employeeName}
    },

    // Selection Fields
    UI.SelectionFields               : [
        companyCode_CompanyCode,
        requestType_code,
        subRequestType_code
    ],

    // Object Page
    UI.FieldGroup #GeneralInformation: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: requestID,
            },
            {
                $Type: 'UI.DataField',
                Value: employeeID_BusinessPartner,
            },
            {
                $Type: 'UI.DataField',
                Value: companyCode_CompanyCode,
            },
            {
                $Type: 'UI.DataField',
                Value: currency_Currency,
            },
            {
                $Type               : 'UI.DataField',
                Value               : requestType_code,
                @Common.FieldControl: {$edmJson: {$If: [
                    {$Eq: [
                        {$Path: 'HasActiveEntity'},
                        false
                    ]},
                    3,
                    1
                ]}}
            },
            {
                $Type: 'UI.DataField',
                Value: subRequestType_code,
            },
            {
                $Type: 'UI.DataField',
                Value: dateFiled,
            },
            {
                $Type: 'UI.DataField',
                Value: period,
            },
            {
                $Type: 'UI.DataField',
                Value: year,
            },
            {
                $Type: 'UI.DataField',
                Value: remarks,
            },
            {
                $Type: 'UI.DataField',
                Value: reference,
            },
            {
                $Type: 'UI.DataField',
                Value: department,
            },
            {
                $Type: 'UI.DataField',
                Value: costCenter_CostCenter,
            },
            {
                $Type: 'UI.DataField',
                Value: area,
            },
        ],
    },

    // Facets
    UI.Facets                        : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneralInformation',
            Label : 'General Information',
            Target: '@UI.FieldGroup#GeneralInformation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'Items',
            Label : {$value: 'Expenses List ({requestTypeDescription})',
            },
            Target: 'expenseList/@UI.LineItem#ExpenseList'
        },
    ],

    // Report
    UI.LineItem                      : [
        {
            $Type: 'UI.DataField',
            Value: requestID
        },
        {
            $Type             : 'UI.DataField',
            Value             : companyCode_CompanyCode,
            @HTML5.CssDefaults: {width: '8rem'}
        },
        {
            $Type             : 'UI.DataField',
            Value             : employeeID_BusinessPartner,
            @HTML5.CssDefaults: {width: '9rem'}
        },
        {
            $Type             : 'UI.DataField',
            Value             : requestType_code,
            @HTML5.CssDefaults: {width: '9rem'}
        },
        {
            $Type             : 'UI.DataField',
            Value             : subRequestType_code,
            @HTML5.CssDefaults: {width: '10rem'}
        },
    ],
);

// Child
annotate srv.ExpenseList with @(UI: {
    Identification                  : [{Value: header_ID}],

    CreateHidden                    : {$edmJson: {$Eq: [
        {Path: 'header/requestType_code'},
        ''
    ]}},

    // Header Information
    HeaderInfo                      : {
        TypeName      : '{i18n>ex}',
        TypeNamePlural: '{i18n>ex}s',
        Title         : {Value: expenseType},
        Description   : {Value: transactionDate}
    },

    LineItem #ExpenseList           : [
        {
            $Type             : 'UI.DataField',
            Value             : transactionDate,
            @HTML5.CssDefaults: {width: '8rem'}
        },
        {
            $Type             : 'UI.DataField',
            Value             : expenseType,
            @HTML5.CssDefaults: {width: '8rem'}
        },
        {
            $Type: 'UI.DataField',
            Value: establishment,
        },
        {
            $Type: 'UI.DataField',
            Value: grossAmount,
        },
    ],

    FieldGroup #GeneralInformation  : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: transactionDate,
            },

            {
                $Type: 'UI.DataField',
                Value: expenseType,
            },
            {
                $Type: 'UI.DataField',
                Value: establishment,
            },
            {
                $Type: 'UI.DataField',
                Value: grossAmount,
            },
        ]
    },

    FieldGroup #OtherDetails        : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: particulars,
            },
            {
                $Type: 'UI.DataField',
                Value: address,
            },
            {
                $Type: 'UI.DataField',
                Value: tin,
            },
            {
                $Type: 'UI.DataField',
                Value: invoiceNumber,
            },
            {
                $Type: 'UI.DataField',
                Value: mileageFrom,
            },
            {
                $Type: 'UI.DataField',
                Value: mileageTo,
            },
            {
                $Type: 'UI.DataField',
                Value: department
            },
            {
                $Type               : 'UI.DataField',
                Value               : costCenter,
                @Common.FieldControl: {$edmJson: {$If: [
                    {$In: [
                        {$Path: 'header/requestType_code'},
                        [
                            'CA',
                            'WER'
                        ]
                    ]},
                    1,
                    3
                ]}}
            },
            {
                $Type: 'UI.DataField',
                Value: internalOrder
            },
            {
                $Type: 'UI.DataField',
                Value: withVat,
            },
            {
                $Type: 'UI.DataField',
                Value: departureDate,
            },
            {
                $Type: 'UI.DataField',
                Value: returnDate,
            },
            {
                $Type: 'UI.DataField',
                Value: dateNeeded,
            },
        ]
    },

    FieldGroup #RequestTypeSpecifics: {
        $Type: 'UI.FieldGroupType',
        Data : [{
            $Type     : 'UI.DataField',
            Value     : productionRelated,
            @UI.Hidden: {$edmJson: {$Ne: [
                {Path: 'header/requestType_code'},
                'RE'
            ]}}
        },
        // {
        //     $Type     : 'UI.DataField',
        //     Value     : departureDate,
        // @UI.Hidden: {$edmJson: {$Ne: [
        //     {Path: 'header/requestType_code'},
        //     'CA'
        // ]}}
        // },
        // {
        //     $Type     : 'UI.DataField',
        //     Value     : returnDate,
        // @UI.Hidden: {$edmJson: {$Ne: [
        //     {Path: 'header/requestType_code'},
        //     'CA'
        // ]}}
        // },
        // {
        //     $Type     : 'UI.DataField',
        //     Value     : dateNeeded,
        // @UI.Hidden: {$edmJson: {$Ne: [
        //     {Path: 'header/requestType_code'},
        //     'CA'
        // ]}}
        // },
        ]
    },

    // Facets
    Facets                          : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneralInformation',
            Label : 'General Information',
            Target: '@UI.FieldGroup#GeneralInformation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'OtherDetails',
            Label : 'Other Details',
            Target: '@UI.FieldGroup#OtherDetails'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'RequestTypeSpecifics',
            Label : 'Request Type Specifics',
            Target: '@UI.FieldGroup#RequestTypeSpecifics'
        },
    ],
});
