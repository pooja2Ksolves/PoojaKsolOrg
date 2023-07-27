/*
Description : Test class for trigger on Account Object
Author : Pooja Rahangdale
Created Date : 24-11-2022
Last Modified Date : 24-11-2022
*/
@isTest
public class AccountActiveFalseToCaseCloseHandlerTest {
    @isTest
    public static void AccountActiveFalseToCaseCloseHandler(){
        //Create sample data 
        List<Account>accList = new List<Account>();
        for(Integer i = 1;i<=5;i++){
           Account acc = new Account();
            acc.Name = 'Test' +i;
            acc.Active__c = 'Yes';
            accList.add(acc);
        }
        
        //Insert data
        Test.startTest();
        Insert accList;
        
        List<Case>caList = new List<Case>();
        for(Account acc :accList){
           Case ca = new Case();
            ca.Origin = 'New';
            ca.Status = 'Phone';
            ca.AccountId = acc.Id;
            caList.add(ca);
        }
        Insert caList;
        
        for(Account acc :accList){
           acc.Active__c = 'No'; 
        }
        update accList;
        
        List<Case>UpdatedcaList = [select Id, Origin, Status from Case WHERE Id =:caList[0].Id];
        
        
        system.assertEquals('close', UpdatedcaList[0].Status);
    }
   
}