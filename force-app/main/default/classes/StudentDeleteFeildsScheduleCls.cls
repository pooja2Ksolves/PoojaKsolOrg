global class StudentDeleteFeildsScheduleCls implements Schedulable
    
    {
    
         global void execute(SchedulableContext sc)
    
         {
    
         StudentDeleteFeildsBatch st = new StudentDeleteFeildsBatch(); // Your batch class
    
           database.executeBatch(st); {
    
    }
         }
    }