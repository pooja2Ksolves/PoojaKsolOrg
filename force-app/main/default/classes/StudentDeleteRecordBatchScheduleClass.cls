global class StudentDeleteRecordBatchScheduleClass implements Schedulable{

    global void execute(SchedulableContext sc)
    
         {
    
             string str='Select Mark_For_Delete__c, Is_Registeration_Completed__c, CreatedDate, CreatedById from student__c where Mark_For_Delete__c = Yes';
                 
         StudentDeleteRecordBatch st = new StudentDeleteRecordBatch(str); // Your batch class
    
           database.executeBatch(st); {
    
    }
         }
}