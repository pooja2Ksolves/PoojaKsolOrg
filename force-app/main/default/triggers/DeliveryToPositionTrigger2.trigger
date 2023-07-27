trigger DeliveryToPositionTrigger2 on Child1__c (after insert,after update,after delete,after undelete) {
DeliveryToPositionTrigger2Handler.DeliveryToPositionTrigger2(trigger.new);
}