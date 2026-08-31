export type TCAPSuiteContext = {
  applicationId: string;
  data: string;
};

export interface ICAPSuitePayload {
  definitionId: string;
  context: TCAPSuiteContext;
}
