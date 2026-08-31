using ExpenseRequestsService as srv from '../../srv/reimbursements-srv';

annotate srv.ExpenseRequests with {
    requestType    @(
        Common.ValueListWithFixedValues: true,
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'ReimbursementRequestTypes',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: requestType_code,
                    ValueListProperty: 'code',
                },
                {
                    $Type            : 'Common.ValueListParameterOut',
                    LocalDataProperty: requestTypeDescription,
                    ValueListProperty: 'description'
                },
            ],
        },
        Common.Text                    : {
            $value             : requestTypeDescription,
            @UI.TextArrangement: #TextLast,
        }
    );

    subRequestType @(
        Common.ValueListWithFixedValues: true,
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'ReimbursementSubRequestTypes',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterIn',
                    LocalDataProperty: requestType_code,
                    ValueListProperty: 'header_code',
                },
                {
                    $Type            : 'Common.ValueListParameterOut',
                    LocalDataProperty: subRequestType_code,
                    ValueListProperty: 'code',
                },
                {
                    $Type            : 'Common.ValueListParameterOut',
                    LocalDataProperty: subRequestTypeDescription,
                    ValueListProperty: 'description',
                },
            ],
        },
        Common.Text                    : {
            $value             : subRequestTypeDescription,
            @UI.TextArrangement: #TextLast,
        }
    );

    // employeeID     @(
    //     Common.ValueList: {
    //         $Type         : 'Common.ValueListType',
    //         CollectionPath: 'BusinessPartnerVH',
    //         Parameters    : [
    //             {
    //                 $Type            : 'Common.ValueListParameterInOut',
    //                 LocalDataProperty: employeeID_BusinessPartner,
    //                 ValueListProperty: 'BusinessPartner',
    //             },
    //             {
    //                 $Type            : 'Common.ValueListParameterOut',
    //                 LocalDataProperty: employeeName,
    //                 ValueListProperty: 'BusinessPartnerName'
    //             },
    //             {
    //                 $Type            : 'Common.ValueListParameterDisplayOnly',
    //                 ValueListProperty: 'BusinessPartnerCategory',
    //             },

    //         ],
    //     },
    //     Common.Text     : {
    //         $value             : employeeName,
    //         @UI.TextArrangement: #TextLast,
    //     }
    // );

    companyCode    @(
        Common.ValueList: {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'CompanyCodeVH',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: companyCode_CompanyCode,
                    ValueListProperty: 'CompanyCode',
                },
                {
                    $Type            : 'Common.ValueListParameterOut',
                    LocalDataProperty: companyCodeText,
                    ValueListProperty: 'CompanyCodeName'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'Country',
                },

            ],
        },
        Common.Text     : {
            $value             : companyCodeText,
            @UI.TextArrangement: #TextLast,
        }
    );

    currency       @(
        Common.ValueList: {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'CurrencyVH',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: currency_Currency,
                    ValueListProperty: 'Currency',
                },
                {
                    $Type            : 'Common.ValueListParameterOut',
                    LocalDataProperty: currencyText,
                    ValueListProperty: 'Currency_Text',
                }
            ]
        },
        Common.Text     : {
            $value             : currencyText,
            @UI.TextArrangement: #TextLast,
        }
    );

// costCenter     @(
//     Common.ValueList: {
//         $Type         : 'Common.ValueListType',
//         CollectionPath: 'CostCenterVH',
//         Parameters    : [
//             {

//                 $Type            : 'Common.ValueListParameterInOut',
//                 LocalDataProperty: costCenter_CostCenter,
//                 ValueListProperty: 'CostCenter',
//             },
//             {
//                 $Type            : 'Common.ValueListParameterOut',
//                 LocalDataProperty: costCenterText,
//                 ValueListProperty: 'CostCenter_Text',
//             },
//             {
//                 $Type            : 'Common.ValueListParameterDisplayOnly',
//                 ValueListProperty: 'ControllingArea',
//             },
//         ]
//     },
//     Common.Text     : {
//         $value             : costCenterText,
//         @UI.TextArrangement: #TextLast
//     }
// );
}
