trigger UpdateRecordType on Customer__c (before insert, before update) {
    for (Customer__c cust : Trigger.new) {
        if (cust.RecordType.Name == 'Technical') {
            cust.RecordTypeId = Schema.SObjectType.Customer__c.getRecordTypeInfosByName().get('Non technical').getRecordTypeId();
        }
        else if (cust.RecordType.Name == 'Non technical') {
            cust.RecordTypeId = Schema.SObjectType.Customer__c.getRecordTypeInfosByName().get('Technical').getRecordTypeId();
        }
    }
}