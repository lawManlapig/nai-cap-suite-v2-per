sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"nai/reimbursements/app/reimbursements/test/integration/pages/ExpenseRequestsList",
	"nai/reimbursements/app/reimbursements/test/integration/pages/ExpenseRequestsObjectPage",
	"nai/reimbursements/app/reimbursements/test/integration/pages/ExpenseListObjectPage"
], function (JourneyRunner, ExpenseRequestsList, ExpenseRequestsObjectPage, ExpenseListObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('nai/reimbursements/app/reimbursements') + '/test/flp.html#app-preview',
        pages: {
			onTheExpenseRequestsList: ExpenseRequestsList,
			onTheExpenseRequestsObjectPage: ExpenseRequestsObjectPage,
			onTheExpenseListObjectPage: ExpenseListObjectPage
        },
        async: true
    });

    return runner;
});

