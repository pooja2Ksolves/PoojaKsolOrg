trigger UpdateRecordTypeName on Customer__c (before insert) {
    // Map to store the record type IDs
    Map<String, Id> recordTypeIds = new Map<String, Id>();
    
    // Query the RecordType object to get the IDs for the Technical and Non-Technical record types
    List<RecordType> recordTypes = [SELECT Id, Name FROM RecordType WHERE SObjectType = 'Customer__c' AND Name IN ('Technical', 'Non-Technical')];
    for(RecordType rt : recordTypes) {
        recordTypeIds.put(rt.Name, rt.Id);
    }
    
    // Loop through the records and update the record type names based on the record type IDs
    for(Customer__c cust : Trigger.new) {
        if(cust.RecordTypeId == recordTypeIds.get('Technical')) {
            cust.RecordTypeId = recordTypeIds.get('Non-Technical');
        } else if(cust.RecordTypeId == recordTypeIds.get('Non-Technical')) {
            cust.RecordTypeId = recordTypeIds.get('Technical');
        }
    }
}