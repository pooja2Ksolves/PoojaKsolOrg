public class OppClosedWonAccountCountHandler {
    
    public Static void oppClosedWonAccountCount(List<Opportunity>OppList){
        List<Opportunity>oppUpdate = new List<Opportunity>();
        Set<id> setId = new Set<Id>();
        
        for(Opportunity oppo : OppList){
            if(oppo.AccountId != null && oppo.StageName == 'Closed Won') setId.add(oppo.AccountId);
        }
        
        List<Account> AccList = [Select Id, Name, 
                                 (Select id, Name, OrderNumber__c, StageName From Opportunities WHERE StageName =: 'Closed Won')
                                 From Account where id=: setId];
        
        system.debug('AccList : ' + AccList.size());
        
        Map<Id, Account> mapAccount = new Map<Id, Account> (AccList);
        
        for(Opportunity oppo : OppList){
            if(oppo.StageName == 'Closed Won' && oppo.AccountId != null) {
                if(mapAccount.containsKey(oppo.AccountId)) {
                    Account objAcc = mapAccount.get(oppo.AccountId);
                    System.debug('sequence : ' + (objAcc.Opportunities.size() + 1));
                    if(oppo.OrderNumber__c == null) oppo.OrderNumber__c = string.valueOf(objAcc.Opportunities.size() + 1) ;
                }
            }
        }        
    }
}