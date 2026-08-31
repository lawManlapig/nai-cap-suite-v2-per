using {cuid} from '@sap/cds/common';

namespace dm;

//========================================
// dm - Data Management Namespace
//========================================

// Constants Table (Global)
@assert.unique: {code: [code]}
entity ConstantsHeader : cuid {
    code        : String  @mandatory  @title: '{i18n>code}';
    description : String  @title: '{i18n>desc}';
    items       : Composition of many ConstantsItems
                      on items.header = $self
                          @title: '{i18n>items}';
}

entity ConstantsItems : cuid {
    header      : Association to ConstantsHeader @title: '{i18n>heade}';
    code        : String                         @mandatory  @title: '{i18n>code}';
    description : String                         @title: '{i18n>desc}';
}
