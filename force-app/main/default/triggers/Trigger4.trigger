trigger Trigger4 on Case (after insert,after update,after delete,after undelete) {
if(trigger.isafter){
        if(trigger.isinsert||trigger.isupdate||trigger.isundelete){
            Trigger4.Trigger4method(trigger.new);
        }
        if(trigger.isupdate||trigger.isdelete){
          Trigger4.Trigger4method(trigger.old);  
        }
    }
}