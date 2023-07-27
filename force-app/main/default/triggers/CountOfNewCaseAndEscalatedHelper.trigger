/*
There should be 2 count fields on the Account, and those should be updated for case updates if case status changes
New Cases Count
Escalated Cases Count

Description :- This trigger is applied on Case Object to get the count of New as well Escalated Status
Author :- Pooja Chamanlal Rahangdale
Created Date :- 24-11-2022
LastModified Date :-24-11-2022
LastModified By :- Pooja Chamanlal Rahangdale
*/
trigger CountOfNewCaseAndEscalatedHelper on Case (after Insert,after Update,after Delete,after Undelete) {
    if(trigger.Isafter){
        if(trigger.IsInsert||trigger.IsUpdate||trigger.IsUndelete){
            CountOfNewCaseAndEscalatedHandler.countOfNewCaseAndEscalatedmethod(trigger.new);
        }
        if(trigger.IsUpdate||trigger.IsDelete){
            CountOfNewCaseAndEscalatedHandler.countOfNewCaseAndEscalatedmethod(trigger.old);  
        }
    }
}