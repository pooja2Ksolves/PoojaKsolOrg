public with sharing class QueryController {
    @AuraEnabled(cacheable=true)
    public static List<Map<String, Object>> getQueryResults(String query) {
        List<Map<String, Object>> results = new List<Map<String, Object>>();
        try {
            List<SObject> records = Database.query(query);
            for (SObject record : records) {
                Map<String, Object> recordMap = new Map<String, Object>();
                for (SObjectField field : record.getSObjectType().getDescribe().fields.getMap().values()) {
                    recordMap.put(field.getDescribe().getName(), record.get(field));
                }
                results.add(recordMap);
            }
        } catch (Exception e) {
            System.debug(e.getMessage());
        }
        return results;
    }
}