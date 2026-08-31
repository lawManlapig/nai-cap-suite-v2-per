using {
    cuid,
    managed
} from '@sap/cds/common';

namespace rb;

@assert.unique: {code: [code]}
entity RequestTypes : cuid, managed {
    key code        : String(2)  @title: '{i18n>rqtyp}'  @mandatory: true;
        description : String     @title: '{i18n>desc}';
        subTypes    : Composition of many SubRequestTypes
                          on subTypes.header = $self;
}

entity SubRequestTypes : cuid, managed {
    header      : Association to RequestTypes;
    code        : String(2)  @title: '{i18n>srqty}'  @mandatory: true;
    description : String     @title: '{i18n>desc}';
}
