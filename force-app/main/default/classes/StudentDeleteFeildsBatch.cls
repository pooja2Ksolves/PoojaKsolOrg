global class StudentDeleteFeildsBatch implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext BC) {
        // collect the batches of records or objects to be passed to execute
        
        String query = 'Select Mark_For_Delete__c, Is_Registeration_Completed__c, CreatedDate, CreatedById from student__c ';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext bc, List<student__c> stuList){
        // process each batch of records
        For(student__c stu :stuList){
            If((stu.Is_Registeration_Completed__c == FALSE) &&(stu.CreatedDate == system.today()-2)){
                stu.Mark_For_Delete__c = 'YES'; 
                
            } 
            try {
                // Update the student__c Record
                update stuList;
                
            } catch(Exception e) {
                System.debug(e);
            }
        }
    }    
    global void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    }  
}