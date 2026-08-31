sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'nai.approvalmatrix.app.approvalmatrix',
            componentId: 'ReimbursementsMatrixList',
            contextPath: '/ReimbursementsMatrix'
        },
        CustomPageDefinitions
    );
});