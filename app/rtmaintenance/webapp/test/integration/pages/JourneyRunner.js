sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"nai/reimbursements/app/rtmaintenance/test/integration/pages/RequestTypesSetList",
	"nai/reimbursements/app/rtmaintenance/test/integration/pages/RequestTypesSetObjectPage",
	"nai/reimbursements/app/rtmaintenance/test/integration/pages/SubRequestTypesSetObjectPage"
], function (JourneyRunner, RequestTypesSetList, RequestTypesSetObjectPage, SubRequestTypesSetObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('nai/reimbursements/app/rtmaintenance') + '/test/flp.html#app-preview',
        pages: {
			onTheRequestTypesSetList: RequestTypesSetList,
			onTheRequestTypesSetObjectPage: RequestTypesSetObjectPage,
			onTheSubRequestTypesSetObjectPage: SubRequestTypesSetObjectPage
        },
        async: true
    });

    return runner;
});

