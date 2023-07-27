public class Trigger4 {
    public static void Trigger4method(List<Case>calist){
        List<account>accList = new List<account>();
        set<Id>idset = new set<Id>();
        for(Case ca :calist){
            idset.add(ca.accountid);
        }
        list<Account>aclist = [Select Id, Name, New_Cases_Count__c, Escalated_Cases_Count__c, (Select Id,status from Cases ) from Account Where id =:idset];
        for(Account ac:aclist){
            
            ac.New_Cases_Count__c = ac.cases.size();
            
            List<Account>alist = [Select Id, Name, New_Cases_Count__c, Escalated_Cases_Count__c, (Select Id,status from Cases where status = 'Escalated') from Account Where id =:idset];
            for(Account a:alist){
                for(case cas :a.cases ){
                    if(cas.status == 'Escalated' ){
                        a.Escalated_Cases_Count__c  = a.cases.size();   
                    }   
                }
                
                acclist.add(ac);
                accList.add(a);
            }
        }
        update acclist;
    }
}