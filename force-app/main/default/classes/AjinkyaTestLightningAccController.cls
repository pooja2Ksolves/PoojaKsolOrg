public with sharing class AjinkyaTestLightningAccController {
    @AuraEnabled
    public static List<Contact> getRelatedList(Id recordId) {
        List<Contact> conList = [SELECT Id, FirstName, LastName, Account.Name FROM Contact WHERE AccountId = :recordId];
        return conList;
    }
    
    @AuraEnabled
    public static void updateRelatedList(List<Contact> conList) {
        if (conList != null && conList.size() > 0) {
            update conList;
        }
    }
}