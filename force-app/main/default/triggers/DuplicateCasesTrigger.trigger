trigger DuplicateCasesTrigger on Case (before insert) {
DuplicateCasesTriggerHandler.DuplicateCase(trigger.new);
}