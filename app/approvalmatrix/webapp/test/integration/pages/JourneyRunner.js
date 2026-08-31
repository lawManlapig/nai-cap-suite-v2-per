sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"nai/approvalmatrix/app/approvalmatrix/test/integration/pages/ReimbursementsMatrixList",
	"nai/approvalmatrix/app/approvalmatrix/test/integration/pages/ReimbursementsMatrixObjectPage",
	"nai/approvalmatrix/app/approvalmatrix/test/integration/pages/IAMUsersObjectPage"
], function (JourneyRunner, ReimbursementsMatrixList, ReimbursementsMatrixObjectPage, IAMUsersObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('nai/approvalmatrix/app/approvalmatrix') + '/test/flp.html#app-preview',
        pages: {
			onTheReimbursementsMatrixList: ReimbursementsMatrixList,
			onTheReimbursementsMatrixObjectPage: ReimbursementsMatrixObjectPage,
			onTheIAMUsersObjectPage: IAMUsersObjectPage
        },
        async: true
    });

    return runner;
});

