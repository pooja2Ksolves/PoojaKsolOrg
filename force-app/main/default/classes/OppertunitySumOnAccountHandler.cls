public class OppertunitySumOnAccountHandler {
    public static void oppertunitySumOnAccount(List<Opportunity>opList){
        List<Account>accList = new List<Account>();
        set<Id> idset = new set<Id>();
        For(Opportunity	 op :opList){
            if(op.StageName == 'Closed Won'){
                idset.add(op.accountId);
            }
        }
        List<Account>acList = [select id , name,Oppertunity_size__c, (Select id, name from Opportunities)from Account Where id IN:idset];
        For(Account a :acList){
            a.Oppertunity_size__c = a.Opportunities.size(); 
            
            accList.add(a);
        }
        If(accList.size()>0){
            update accList;   
        }  
    }
}