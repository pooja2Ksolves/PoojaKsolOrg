public with sharing class DisplayList3 {
    @AuraEnabled(cacheable = true)
    public static Map<String,String> getOptionsForSelectedPicklistField(string selectedObjectName, string selectedField){
        try {
            System.debug('selectedObjectName '+selectedObjectName);
            System.debug('selectedField '+selectedField);
            Map<String,String> options = new  Map<String,String>(); 
            Map<String, Schema.SObjectField> mapFields = Schema.getGlobalDescribe().get(selectedObjectName).getDescribe().fields.getMap();
            Schema.DescribeFieldResult pickFieldResult = mapFields.get(selectedField).getDescribe();   
            List<Schema.PicklistEntry> picklistFields1 = pickFieldResult.getPicklistValues();
                for( Schema.PicklistEntry pickListFields2 : picklistFields1)
                {
                    options.put(pickListFields2.getLabel(),pickListFields2.getValue());
                }       
            return options;
        } catch (Exception e) {
            return null;
        }
    }

}