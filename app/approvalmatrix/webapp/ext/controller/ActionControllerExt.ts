import Fragment from "sap/ui/core/Fragment";
import Dialog from "sap/m/Dialog";
import { CustomExtensionAPI } from "./types";
import Filter from "sap/ui/model/Filter";
import FilterOperator from "sap/ui/model/FilterOperator";


/**
 * Reset value state of input fields in create from template dialog when the value is changed to provide better user experience.
 * 
 * @param this 
 * @param oEvent 
 */
export function onValueHelpInputChange(this: any, oEvent: any) {
  oEvent.getSource().setValueState("None");
  oEvent.getSource().setValueStateText("");
}

/**
 * Generated event handler.
 * 
 * @param this
 */
export function onOpenAssignUserDialog(this: CustomExtensionAPI) {
  if (!this._AssignUserDialog) {
    this._AssignUserDialog = Fragment.load({
      id: "AssignUserFragment",
      name: "nai.approvalmatrix.app.approvalmatrix.ext.fragment.AssignUserDialog",
      controller: this,
    }).then((oDialog: any) => {
      this._AssignUserDialog = oDialog as Dialog;

      //set models
      this._AssignUserDialog.setModel(this.getModel("i18n") || "", "i18n");
      this._AssignUserDialog.setModel(
        this.getModel("globalJsonModel") || "",
        "globalJsonModel",
      );
      this._AssignUserDialog.setModel(this.getModel("") || "", "");
      this._AssignUserDialog.setModel(this.getModel("vh") || "", "vh");
      this._AssignUserDialog.open();
    });
  } else {
    this._AssignUserDialog.open();
  }
}

/**
 * 
 * 
 * @param this 
 * @param oEvent 
 */
export function onSCIMUsersVH(this: any, oEvent: any) {
  const sValue = oEvent.getSource().getValue();

  // Create value help dialog
  if (!this._scimUsersVHDialog) {
    let that = this;
    Fragment.load({
      id: "SCIMUsersVHFragment",
      name: "nai.approvalmatrix.app.approvalmatrix.ext.fragment.SCIMUsersVH",
      controller: this,
    }).then((oDialog: any) => {
      that._scimUsersVHDialog = oDialog; // Store the actual dialog
      that.addDependent(oDialog);

      // Set vh model
      oDialog.setModel(that.getModel("vh"), "vh");

      // Apply filter and open
      oDialog
        .getBinding("items")
        .filter([new Filter("userName", FilterOperator.Contains, sValue)]);
      oDialog.open();
    });
  } else {
    // Dialog exists, apply filter and open
    this._scimUsersVHDialog
      .getBinding("items")
      .filter([new Filter("userName", FilterOperator.Contains, sValue)]);
    this._scimUsersVHDialog.open();
  }
}