using ExpenseRequestsService as srv from '../../srv/reimbursements-srv';

//========================================
// Field Properties
//========================================
annotate srv.ExpenseRequests with {
    requestID  @(Core.Computed: true);
    employeeID @(Core.Computed: true);
    department @(Core.Computed: true);
    costCenter @(Core.Computed: true);
    area       @(Core.Computed: true);
    period     @(Core.Computed: true);
    year       @(Core.Computed: true);
}


//========================================
// Side Effects
//========================================
annotate srv.ExpenseRequests @(Common: {SideEffects #DateFileChanged: {
    SourceProperties: ['dateFiled'],
    TargetProperties: [
        'period',
        'year'
    ]
}});
