import FilterOperator from "sap/ui/model/FilterOperator";
import { CustomExtensionAPI } from "./types";
import Filter from "sap/ui/model/Filter";
import Fragment from "sap/ui/core/Fragment";
import Input from "sap/m/Input";
import BusyIndicator from "sap/ui/core/BusyIndicator";
import MessageBox from "sap/m/MessageBox";
import ODataModel from "sap/ui/model/odata/v4/ODataModel";
import MessageToast from "sap/m/MessageToast";
import Messaging from "sap/ui/core/Messaging";

/**
 * Generated event handler.
 *
 * @param this reference to the 'this' that the event handler is bound to.
 * @param context the context of the page on which the event was fired. `undefined` for list report page.
 * @param selectedContexts the selected contexts of the table rows.
 */
export function onValueHelpSearch(this: any, oEvent: any) {
  const sInputValue = oEvent.getParameter("value");
  const oFilter = new Filter(
    _getEntityFieldByDialogID(oEvent.getSource().sId),
    FilterOperator.Contains,
    sInputValue,
  );
  oEvent.getSource().getBinding("items").filter([oFilter]);
}

/**
 * Handles the confirm event for the value help dialog.
 *
 * @param this
 * @param oEvent
 * @returns
 */
export function onValueHelpConfirm(this: any, oEvent: any) {
  let oSelectedItem = oEvent.getParameter("selectedItem");
  oEvent.getSource().getBinding("items").filter([]);
  if (!oSelectedItem) {
    return;
  }
  const oField = (Fragment.byId(
    "CreateFromTemplateFragment",
    _getFieldByDialogID(oEvent.getSource().sId),
  ) ||
    Fragment.byId(
      "AssignUserFragment",
      _getFieldByDialogID(oEvent.getSource().sId),
    )) as Input;
  oField.setValueState("None");
  oField.setValue(oSelectedItem.getTitle());
}

/**
 * Handles the assignment of a user to an approver group.
 *
 * @param this
 * @param oEvent
 */
export async function onAssignUser(this: any, oEvent: any) {
  BusyIndicator.show(0);
  debugger;
  const oAssignUserInput = Fragment.byId(
    "AssignUserFragment",
    "assignUserField",
  ) as Input;

  try {
    await _validateSCIMUser.call(this, oAssignUserInput);
    const oModel: ODataModel = this.getModel() as ODataModel;
    const oContextBinding = oModel.bindList(
      "/SCIMUsers",
      undefined,
      undefined,
      undefined,
      {
        $$updateGroupId: "assignUserGroup",
      },
    );
    oContextBinding.create({
      ID: "",
      userName: oAssignUserInput.getValue(),
      _groups_ID: this.getBindingContext().getProperty("approverGroup"),
    });
    oModel
      .submitBatch("assignUserGroup")
      .then(() => {
        BusyIndicator.hide();
        const oMessageModel = Messaging.getMessageModel();
        // const oMessage = oMessageModel.getData()[0];
        const oMessage = oMessageModel
          .getData()
          .find((msg: any) => msg.code !== undefined);

        if (oMessage) {
          if (oMessage.code && oMessage.type === "Error") {
            MessageBox.error(oMessage.message);
            Messaging.removeAllMessages();
            return;
          }
        }
        if (this._AssignUserDialog) {
          onCancelAssignDialog.call(this);
          MessageToast.show("User assigned successfully");
          this.getModel().refresh();
        }
      })
      .catch((error: any) => {
        BusyIndicator.hide();
        console.log(error);
        MessageBox.error(
          error.message || "Failed to assign user. Please try again.",
        );
      });
  } catch (error: any) {
    BusyIndicator.hide();
    console.log(error);
    MessageBox.error(error.message);
  }
}

/**
 * Cancels the assign user dialog.
 *
 * @param this
 */
export function onCancelAssignDialog(this: CustomExtensionAPI) {
  if (this._AssignUserDialog) {
    this._AssignUserDialog.close();
    this._AssignUserDialog.destroy();
    this._AssignUserDialog = undefined;
  }
}

async function _validateSCIMUser(this: any, oInput: Input): Promise<void> {
  if (!oInput.getValue() || oInput.getValue().trim() === "") {
    oInput.setValueState("Error");
    throw new Error("Please fill in all required fields.");
  }
  const oModel: ODataModel = this.getModel("vh");
  const oBinding = oModel.bindList(`/SCIMUsersVH`, undefined, undefined, [
    new Filter("userName", FilterOperator.EQ, oInput.getValue()),
  ]);
  const aContexts = await oBinding.requestContexts(0, 1);
  if (aContexts.length === 0) {
    oInput.setValueState("Error");
    throw new Error("Invalid user. Please enter a valid user and try again.");
  }
}
/**
 * Gets the corresponding field in the create template dialog based on the dialog id.
 *
 * @param sId
 * @returns
 */
function _getFieldByDialogID(sId: string): string {
  switch (sId) {
    case "CompanyCodeVHFragment--companyCodeVHDialog":
      return "companyCodeField";
    case "DepartmentVHFragment--departmentVHDialog":
      return "departmentField";
    case "ApproverGrpVHFragment--approverGroupVHDialog":
      return "approverReferenceField";
    case "SCIMUsersVHFragment--SCIMUsersVHDialog":
      return "assignUserField";
    default:
      return "";
  }
}

/**
 * Gets the corresponding field in the OData model based on the dialog id.
 *
 * @param sId
 * @returns
 */
function _getEntityFieldByDialogID(sId: string): string {
  switch (sId) {
    case "CompanyCodeVHFragment--companyCodeVHDialog":
      return "CompanyCode";
    case "DepartmentVHFragment--departmentVHDialog":
      return "code";
    case "ApproverGrpVHFragment--approverGroupVHDialog":
      return "approverGroup";
    case "SCIMUsersVHFragment--SCIMUsersVHDialog":
      return "userName";
    default:
      return "";
  }
}
