export abstract class BaseApproverMatrix {
  abstract AssignUserToGroup(
    approverGroup: string,
    userId: string,
    remoteService: any,
  ): Promise<void>;
}
