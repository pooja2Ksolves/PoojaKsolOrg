trigger OppClosedWonAccountCountTrigger on Opportunity (after insert,after update) {
OppClosedWonAccountCountHandler.oppClosedWonAccountCount(trigger.new);
}