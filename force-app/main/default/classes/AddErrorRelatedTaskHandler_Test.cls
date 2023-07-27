@isTest
public class AddErrorRelatedTaskHandler_Test {
    @isTest
    public static void AddErrorRelatedTask_Test(){
        List<Task>taList = New List<Task>();
       
     case ca = New case();
        ca.status = 'Open';
           ca.Origin='Phone';
            ca.Case_Genre__c='Enquiry';
        insert ca;
         ca.status = 'Close';
        Update ca;
      
             for(Integer i=0; i<5 ;i++){
      Task ta = New Task(Subject ='Call', Status = 'Deferred' ,Priority = 'High');
        taList.add(ta);
        
        }
         taList[0].WhatId = ca.id;
        insert taList;
         
        
   
        // Get the test cases
        List<Case> cases = [SELECT Id, Status FROM Case];

        // Get the related cases map
        Map<Id, Case> relatedCasesMap = new Map<Id, Case>([SELECT Id, Status FROM Case]);

        // Call the method being tested
        Test.startTest();
        AddErrorRelatedTaskHandler.AddErrorRelatedTask(cases, relatedCasesMap);
        Test.stopTest();
       
        Database.SaveResult result = Database.update(ca, false);
        System.assertEquals('is not allowed for DML', result.getErrors()[0].getMessage());

        
}
}