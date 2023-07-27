Global class StudentDeleteRecordBatch Implements Database.batchable<sobject>{

   
     global Database.QueryLocator start(Database.BatchableContext BC) {
        // collect the batches of records or objects to be passed to execute
        
        String query = 'Select Mark_For_Delete__ring qc, Is_Registeration_Completed__c, CreatedDate, CreatedById from student__c where Mark_For_Delete__c = Yes';
        return Database.getQueryLocator(query);
    }
         global  void execute(Database.BatchableContext BC,List<student__c> scope){
         delete scope;
    
    }
    global void finish(Database.BatchableContext BC){
    }

}