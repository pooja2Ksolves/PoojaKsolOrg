public with sharing class DisplayList2 {
    @AuraEnabled(cacheable=true)
    public static Map<String,String> getAllPicklistTypeFields(String strAccountName) {
        Map<String, Schema.SObjectType> detail = Schema.getGlobalDescribe();
        Map<String,String> mapOfPicklistTypeFields = new  Map<String,String>();
        for(Schema.SObjectField fields :detail.get(strAccountName).getDescribe().fields.getMap().Values()) {
            If(fields.getDescribe().getType() == Schema.DisplayType.PICKLIST) { 
                mapOfPicklistTypeFields.put(fields.getDescribe().getName() , fields.getDescribe().getName());
            }
        }
        return mapOfPicklistTypeFields;
    }
    
}