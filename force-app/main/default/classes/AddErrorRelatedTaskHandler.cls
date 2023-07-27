/*while closing a case if any task related to it is 
 open throw an ERROR.*/

public class AddErrorRelatedTaskHandler {
    public static void AddErrorRelatedTask(List<Case> caList, Map<Id, Case> caMap) {
        Set<Id> idSet = new Set<Id>();
        for (Case ca : caList) {
            if (ca.Status == 'Close' && caMap.get(ca.Id).Status != 'Close') {
                idSet.add(ca.Id);
            }
        }
        if (!idSet.isEmpty()) {
            List<Task> openTasks = [SELECT WhatId FROM Task WHERE WhatId IN :idSet AND Status != 'Completed'];
            if (!openTasks.isEmpty()) {
                for (Case ca : caList) {
                    if (idSet.contains(ca.Id)) {
                        ca.addError('Cannot close case with open related tasks.');
                    }
                }
            }
        }
    }
}