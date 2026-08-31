using rb from '../db/rmb-types';

service ReimbursementTypesService {
    @odata.draft.enabled
    entity RequestTypesSet    as projection on rb.RequestTypes;

    entity SubRequestTypesSet as projection on rb.SubRequestTypes;
}
