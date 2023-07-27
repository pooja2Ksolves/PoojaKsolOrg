trigger caseTrigger on Case (before update) {
caseTriggerHandler.caseTrigger(trigger.new,trigger.oldMap);
}