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
public class CountOfNewCaseAndEscalatedHandler {
    public static void countOfNewCaseAndEscalatedmethod(List<Case>CaList){
        Set<Id>setid = new Set<Id>();
        try{
            for(Case ca :CaList){
                if(ca.AccountId != Null){
                    setid.add(ca.accountid);  
                }
            }
            
            Map<Id, Account> escalatedcasemap = new Map<Id, Account> ([Select Id, (Select Id, Status from Cases where Status = 'Escalated') from Account where Id IN : setid ]);
            Map<Id, Account> newcasemap =  new Map<Id, Account> ([Select Id, (Select Id, Status from Cases where Status = 'New') from Account where Id IN : setid ]);
            
            List<Account> AccList = new List<Account>();
            List<Account>acList = [Select Id, name,Escalated_Cases_Count__c, New_Cases_Count__c from Account  where Id IN :setid];
            For( Account acc : acList){
                acc.Escalated_Cases_Count__c = escalatedcasemap.get(acc.Id).Cases.size();
                acc.New_Cases_Count__c = newcasemap.get(acc.Id).Cases.size();
                AccList.add(acc);
            }
            if(AccList != Null){
                update AccList;
            }
        }
        catch(Exception ex){
            System.debug('Exception :- ' + ex.getMessage() + 'Line No' + ex.getLineNumber());
        }
    }
    
}