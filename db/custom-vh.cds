namespace cvh;

using { sap.common.CodeList } from '@sap/cds/common';

@cds.odata.valuelist
entity Department : CodeList {
    key code: String(3)
}

type DepartmentCode : String(3);
type CompanyCode : String(4);
