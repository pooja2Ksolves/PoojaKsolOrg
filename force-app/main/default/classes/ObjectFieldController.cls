public with sharing class ObjectFieldController {
    public class SelectOptionWrapper {
        @AuraEnabled public String label;
        @AuraEnabled public String value;
        
        public SelectOptionWrapper(String label, String value) {
            this.label = label;
            this.value = value;
        }
    }
    
    @AuraEnabled(cacheable=true)
    public static List<SelectOptionWrapper> getObjectOptions() {
        List<SelectOptionWrapper> options = new List<SelectOptionWrapper>();
        for (Schema.SObjectType objectType : Schema.getGlobalDescribe().values()) {
            options.add(new SelectOptionWrapper(objectType.getDescribe().getLabel(), objectType.getDescribe().getName()));
        }
        return options;
    }
    
    @AuraEnabled(cacheable=true)
    public static List<SelectOptionWrapper> getFieldOptions(String objectName) {
        List<SelectOptionWrapper> options = new List<SelectOptionWrapper>();
        if (String.isNotBlank(objectName)) {
            Schema.DescribeSObjectResult describeResult = Schema.getGlobalDescribe().get(objectName).getDescribe();
            for (Schema.SObjectField field : describeResult.fields.getMap().values()) {
                options.add(new SelectOptionWrapper(field.getDescribe().getLabel(), field.getDescribe().getName()));
            }
        }
        return options;
    }
    
    @AuraEnabled(cacheable=true)
    public static List<sObject> fetchRecords(String query) {
        return Database.query(query);
    }
}