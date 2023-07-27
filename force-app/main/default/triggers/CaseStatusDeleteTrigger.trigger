trigger CaseStatusDeleteTrigger on Case (before delete) {
CaseStatusDeleteHandler.caseStatusDelete(trigger.old);
}