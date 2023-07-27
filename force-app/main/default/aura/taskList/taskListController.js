({
    fetchTasks: function(component, event, helper) {
        component.set('v.mycolumns', [
            {
                label: 'Serial Number',
                type: 'number',
                initialWidth: 70,
                sortable: false,
                cellAttributes: { alignment: 'left' },
                typeAttributes: { minimumIntegerDigits: 1 },
                fieldName: 'serialNumber'
            },
            {
                label: 'Subject',
                fieldName: 'subjectLink',
                type: 'url',
                typeAttributes: {
                    label: {
                        fieldName: 'Subject'
                    },
                    target: '_blank'
                }
            },
            {
                label: 'Due Date',
                fieldName: 'ActivityDate',
                type: 'date',
                typeAttributes: {
                    weekday: 'long',
                    year: 'numeric',
                    month: 'long',
                    day: '2-digit'
                }
            },
            // Add other columns here
        ]);

        var action = component.get("c.getTaskList");
        action.setParams({});
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var records = response.getReturnValue();
                records.forEach(function(record, index) {
                    record.serialNumber = index + 1;
                    record.WhatName = record.What.Name;
                    record.WhatId = '/' + record.WhatId;
                    record.Priority = record.Priority;
                    record.DemoLink = '/lightning/o/Task/home';
                    record.OwnerName = record.Owner.Name;
                    record.OwnerId = '/' + record.OwnerId;
                    record.subjectLink = '/' + record.Id;
                    if (record.Status === 'Not Started') {
                        record.statusIconName = 'standard:assignment';
                        record.statusIconLabel = record.Status;
                        record.Status = '';
                    }
                    if (record.Status === 'In Progress') {
                        record.statusIconName = 'standard:investment_account';
                        record.statusIconLabel = record.Status;
                        record.Status = '';
                    }
                    if (record.Status === 'Waiting on someone else') {
                        record.statusIconName = 'standard:call';
                        record.statusIconLabel = record.Status;
                        record.Status = '';
                    }
                    if (record.Status === 'Deferred') {
                        record.statusIconName = 'standard:first_non_empty';
                        record.statusIconLabel = record.Status;
                        record.Status = '';
                    }
                    if (record.Status === 'Completed') {
                        record.statusIconName = 'standard:task2';
                        record.statusIconLabel = record.Status;
                        record.Status = '';
                    }
                });
                console.log(records);
            }
            component.set("v.taskList", records);
        });
        $A.enqueueAction(action);
    }
})