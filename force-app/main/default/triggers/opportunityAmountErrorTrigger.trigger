trigger opportunityAmountErrorTrigger on Opportunity (before insert,before update) {
opportunityAmountErrorHandler.opportunityAmountError(trigger.new);
}