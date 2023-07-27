/*When oppertunity stage is changed to closed won we need to update 
 closed date to today.*/
trigger OppClosedToToday on Opportunity (before update) {
OppClosedToTodayHandler.OppClosedToToday(Trigger.New ,Trigger.OldMap);
}