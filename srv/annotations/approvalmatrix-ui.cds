using { ApproverMatrixService as srv } from '../approver-matrix-srv';

annotate srv.ReimbursementsMatrix with @(
    odata.draft.enabled,
    // UI.CreateHidden: true,
    UI.SelectionFields: [
        position,
        approverGroup,
        approverType,
        approverLevel,
    ],
    UI.HeaderInfo: {
        $Type         : 'UI.HeaderInfoType',
        Title         : {
            $Type: 'UI.DataField',
            Value: approverGroup
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: ID
        },
        TypeName: 'Reimbursements Approver',
        TypeNamePlural: 'Reimbursements Approvers'
    },
    UI.Facets: [
        {
            $Type: 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#ReimbursementAMHeader',
            ID: 'idReimbursementAMHeader',
            Label: '{i18n>apprvGroupSectionTitle}'
        },
        {
            $Type: 'UI.ReferenceFacet',
            Target: '_members/@UI.LineItem#SCIMUsers',
            ID: 'idUsers',
            Label: '{i18n>listOfApprovers}'
        }
    ],
    UI.FieldGroup #ReimbursementAMHeader: {
        $Type: 'UI.FieldGroupType',
        Data: [
            {
                $Type : 'UI.DataField',
                Value : position,
            },                        
            {
                $Type : 'UI.DataField',
                Value : approverType,
            },
            {
                $Type : 'UI.DataField',
                Value : approverLevel,
            },
            {
                $Type : 'UI.DataField',
                Value : amountQuota,
            },
        ]
    },

    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : position,
            ![@HTML5.CssDefaults]: {width: '20%'}
        },
        {
            $Type : 'UI.DataField',
            Value : approverGroup,
            ![@HTML5.CssDefaults]: {width: '20%'}
        },
        {
            $Type : 'UI.DataField',
            Value : approverType,
            ![@HTML5.CssDefaults]: {width: '20%'}
        },
        {
            $Type : 'UI.DataField',
            Value : approverLevel,
            ![@HTML5.CssDefaults]: {width: '20%'}
        },
    ]
);

annotate srv.SCIMUsers with @(
    UI.LineItem #SCIMUsers: [{
            Value: userName,
            ![@HTML5.CssDefaults]: {width: '25%'}
        },
        {
            Value: displayName,
            ![@HTML5.CssDefaults]: {width: '25%'}
        },
        {
            Value: email,
            ![@HTML5.CssDefaults]: {width: '25%'}
        },
        {
            Value: title,
            ![@HTML5.CssDefaults]: {width: '25%'}
    }],
)