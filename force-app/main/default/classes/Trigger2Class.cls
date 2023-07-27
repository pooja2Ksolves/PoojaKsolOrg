public class Trigger2Class {
        public static void Trigger2method(list<Account>acclist){
           set<Id>idset = new set<Id>();
            for(Account acc :acclist){
                if(acc.Active__c== 'No'){
                   idset.add(acc.Id); 
                }
    }
            List<Case>calist= [select Id, Status from Case where status != 'Escalated' and AccountId =:idset];
            for(Case ca :calist){
             ca.Status ='close';   
            }
            if(calist !=Null){
              update calist; 
            }
        }
    }