/*while closing a case if any task related to it is 
 open throw an ERROR.*/
trigger AddErrorRelatedTaskTrigger on Case (before Update) {
AddErrorRelatedTaskHandler.AddErrorRelatedTask(trigger.new,trigger.OldMap);
}