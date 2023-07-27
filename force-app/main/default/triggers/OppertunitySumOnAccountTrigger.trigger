Trigger OppertunitySumOnAccountTrigger on Opportunity(after insert,after update,after delete,after undelete){
    if(trigger.isafter){
        if(trigger.isinsert|| trigger.isupdate||trigger.isundelete){
            OppertunitySumOnAccountHandler.oppertunitySumOnAccount(trigger.new);
        }
        if(trigger.isupdate||trigger.isdelete){
            OppertunitySumOnAccountHandler.oppertunitySumOnAccount(trigger.old);
        }
    }
}