sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'nai.reimbursements.app.rtmaintenance',
            componentId: 'RequestTypesSetList',
            contextPath: '/RequestTypesSet'
        },
        CustomPageDefinitions
    );
});