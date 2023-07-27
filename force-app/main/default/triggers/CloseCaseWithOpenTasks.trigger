trigger CloseCaseWithOpenTasks on Case (before update) {
    // collect the case IDs being closed and their related tasks
    Set<Id> closingCaseIds = new Set<Id>();
    Map<Id, List<Task>> relatedTasksByCaseId = new Map<Id, List<Task>>();
    for (Case updatedCase : Trigger.new) {
        if (updatedCase.Status == 'Close' && Trigger.oldMap.get(updatedCase.Id).Status != 'Closed') {
            closingCaseIds.add(updatedCase.Id);
            relatedTasksByCaseId.put(updatedCase.Id, [SELECT Id, Status FROM Task WHERE WhatId = :updatedCase.Id]);
        }
    }
    
    // check if any related task is still open
    for (Id closingCaseId : closingCaseIds) {
        for (Task relatedTask : relatedTasksByCaseId.get(closingCaseId)) {
            if (relatedTask.Status != 'Completed' && relatedTask.Status != 'Cancelled') {
                Trigger.newMap.get(closingCaseId).addError('Cannot close case with open task: ' + relatedTask.Subject);
                break;
            }
        }
    }
}