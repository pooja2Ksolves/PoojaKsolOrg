public with sharing class AccountContactController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getAccountContacts(Id accountId) {
        return [SELECT Id, Name, Account.Name, Email, Phone FROM Contact WHERE AccountId = :accountId];
    }
    
    @AuraEnabled
    public static void saveContactChanges(List<Contact> contactData) {
        update contactData;
    }
}