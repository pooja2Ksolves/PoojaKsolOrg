/*
When Account is Deactivated by updating its Active field to False
All of the Cases for this Account should be closed by updating their Status field to Closed if those are not in the Escalated Status.


Description :- This trigger is applied on Account Object depending upon the value of active feild  update case status to close  if  it is not in the Escalated Status.

Author :- Pooja Chamanlal Rahangdale
Created Date :- 24-11-2022
LastModified Date :-24-11-2022
LastModified By :- Pooja Chamanlal Rahangdale
*/
public class AccountActiveFalseToCaseCloseHandler {
    public static void AccountActiveFalseToCaseClosemethod(list<Account>accList,Map<Id,Account>oldMap){
        List<Case> caList = new List<Case>();
        set<Id>accIds = new set<Id>();
        for(Account acc :accList){
            if(acc.Active__c == 'No' && oldMap.get(acc.Id).Active__c == 'Yes'){
              accIds.add(acc.Id);  
            }   
        }
    
        
        if(!accIds.isEmpty()){
            List<Account>acList = [select Id, Name, Active__c, (select Id, AccountId, Status from Cases )from Account WHERE Id =:accIds ];
            for(Account ac :acList){
                if(ac.Cases !=Null){
                for(Case ca :ac.Cases){
                    if(ca.status != 'Escalated'){
                      ca.status ='close'; 
                        caList.add(ca);
                    }
                } 
                }   
            }  
        }
        if(!caList.isEmpty()){
          Update caList;  
        }
      
    }
}