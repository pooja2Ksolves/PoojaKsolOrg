public with sharing class lwcLifetimeSpendingController {
    @AuraEnabled (cacheable=true)
    public static List<AggregateResult> getAccountLifetimeSpending(String accId){
   
        return [SELECT  Account.Name , SUM(AMOUNT),count(id) 
        FROM Opportunity
                WHERE AccountId =:accId
        
        GROUP BY Account.Name  ];
    }
}