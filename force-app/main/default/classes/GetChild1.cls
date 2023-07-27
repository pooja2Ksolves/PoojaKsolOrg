public with sharing class GetChild1 {
    @AuraEnabled(cacheable=true)
    public static sobjectWrapper getchildmethod(Id ParentId) {
        sobjectWrapper osobjectWrapper = new sobjectWrapper();
        
        osobjectWrapper.lstChild = [SELECT Id, Name, Parent__c FROM Child1__c WHERE Parent__c = :ParentId];
        osobjectWrapper.secondChild = [SELECT Id, Name, Parent__c FROM Child2__c WHERE Parent__c = :ParentId];
        osobjectWrapper.thirdChild = [SELECT Id, Name, Parent__c FROM Child3__c WHERE Parent__c = :ParentId];
        
        return osobjectWrapper;
    }

    public class sobjectWrapper {
        @AuraEnabled
        public List<Child1__c> lstChild { get; set; }
        @AuraEnabled
        public List<Child2__c> secondChild { get; set; }
        @AuraEnabled
        public List<Child3__c> thirdChild { get; set; }
    }
}