import ExtensionAPI from "sap/fe/core/ExtensionAPI";
import Context from "sap/ui/model/odata/v4/Context";
import Dialog from "sap/m/Dialog";
import Filter from "sap/ui/model/Filter";
import ODataModel from "sap/ui/model/odata/v4/ODataModel";

// Extend ExtensionAPI with custom properties
export interface CustomExtensionAPI extends ExtensionAPI {
  _AssignUserDialog?: any;
  _CreateTemplateDialog?: any;
  _companyCodeVHDialog?: any;
  getModel(modelName: string): ODataModel;
  getBindingContext(): Context;
}
