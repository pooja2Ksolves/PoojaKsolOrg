trigger ChildToParentTrigger on Child1__c (after insert) {
ChildToParentTriggerHandler.ChildToParent(trigger.new);
}