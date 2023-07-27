trigger CaseToAccountTrigger on Case (after insert,after update) {
CaseToAccountHandler.caseToAccount(trigger.new);
}