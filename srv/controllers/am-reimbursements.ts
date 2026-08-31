import { BaseApproverMatrix } from "./BaseApproverMatrix";

export class ReimbursementsApproverMatrix extends BaseApproverMatrix {
    
  async AssignUserToGroup(
    approverGroup: string,
    userId: string,
    remoteService: any,
  ): Promise<void> {
    const scimGroup: any = await remoteService.send({
      method: "GET",
      path: "/Groups",
      headers: {
        Accept: "application/scim+json",
        "Content-Type": "application/scim+json",
      },
    });

    const groupData = scimGroup?.Resources?.find(
      (g: any) => g.displayName === approverGroup,
    );
    if (!groupData) {
      throw new Error("APPROVER_GROUP_NOT_YET_CREATED");
    }
    //Get UUID of User
    const scimUsers: any = await remoteService.send({
      method: "GET",
      path: "/Users",
      headers: {
        Accept: "application/scim+json",
        "Content-Type": "application/scim+json",
      },
    });
    const userUUID = scimUsers?.Resources?.find(
      (u: any) => u.userName === userId,
    )?.id;

    if (!userUUID) {
      throw new Error("USER_NOT_FOUND");
    }

    //Check if user already assigned in group
    const isUserAssigned = groupData.members?.some(
      (m: any) => m.value === userUUID,
    );
    if (isUserAssigned) {
      throw new Error("USER_ALREADY_ASSIGNED");
    }

    //Perform adding user into the group
    await remoteService.send({
      method: "PATCH",
      path: `/Groups/${groupData.id}`,
      headers: {
        Accept: "application/scim+json",
        "Content-Type": "application/scim+json",
      },
      data: {
        schemas: ["urn:ietf:params:scim:api:messages:2.0:PatchOp"],
        Operations: [
          {
            op: "add",
            path: "members",
            value: [
              {
                value: userUUID,
                type: "User",
              },
            ],
          },
        ],
      },
    });
  }
}
