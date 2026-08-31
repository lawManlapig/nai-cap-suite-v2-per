using ReimbursementTypesService as service from '../../srv/rmb-types-srv';

annotate service.RequestTypesSet with @(
    // Header Info
    UI.HeaderInfo                    : {
        TypeName      : '{i18n>rqtyp}',
        TypeNamePlural: '{i18n>rqtyp}s',
        Title         : {Value: description},
        Description   : {Value: createdAt},
    },

    // Field Group
    UI.FieldGroup #GeneralInformation: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: code,
            },
            {
                $Type: 'UI.DataField',
                Value: description,
            },
        ],
    },

    UI.Facets                        : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneralInformation',
            Label : 'General Information',
            Target: '@UI.FieldGroup#GeneralInformation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'SubRequestTypes',
            Label : 'Sub Request Types',
            Target: 'subTypes/@UI.LineItem#SubRequestTypes',
        },
    ],

    UI.LineItem                      : [
        {
            $Type             : 'UI.DataField',
            Value             : code,
            @HTML5.CssDefaults: {width: '8rem',
            },
        },
        {
            $Type: 'UI.DataField',
            Value: description,
        },
    ],
);

annotate service.SubRequestTypesSet with @(
    UI.Identification           : [{Value: header_ID}],

    // Line Item
    UI.LineItem #SubRequestTypes: [
        {
            $Type             : 'UI.DataField',
            Value             : code,
            @HTML5.CssDefaults: {width: '10rem',
            },
        },
        {
            $Type: 'UI.DataField',
            Value: description,
        },
    ],
)
