public class Trigger1Class {
    Public static void Trigger1method(list<Account>acclist){
        set<Id>idset = new set<Id>();
        
        for(Account acc :acclist){
            
            idset.add(acc.id);  
        }
        list<Account>aclist = [select id,name,Active__c ,(select Id,status from cases Where status='Escalated' ) from account where id=:idset];
        for(Account acc :aclist){
            for(case ca : acc.cases){
                if(acc.Active__c ==Null){
                    acc.adderror('There are some escalated cases for this account. Please close them first.');   
                }    
            }  
        }
    }
}