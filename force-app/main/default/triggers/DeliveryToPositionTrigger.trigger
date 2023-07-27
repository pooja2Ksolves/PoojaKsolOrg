trigger DeliveryToPositionTrigger on Child1__c (before update) {
DeliveryToPositionTriggerHandler.DeliveryToPosition(trigger.new);
}