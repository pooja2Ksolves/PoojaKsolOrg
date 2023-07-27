trigger ParentCreateToChildTrigger on Parent__c (after insert) {
ParentCreateToChildHandler.ParentCreateToChild(trigger.new);
}