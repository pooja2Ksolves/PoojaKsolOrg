public with sharing class QueryBuilderController {
    @AuraEnabled(cacheable=true)
    public static List<sObject> executeQuery(String objectName, String fields) {
        String queryString = 'SELECT ' + fields + ' FROM ' + objectName;
        return Database.query(queryString);
    }
}