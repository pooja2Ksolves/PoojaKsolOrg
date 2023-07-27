public with sharing class AccountController2 {
    @AuraEnabled(cacheable=true)
    public static Account getAccount(String accountId) {
        return [SELECT Phone2__c FROM Account WHERE Id = :accountId];
    }
}