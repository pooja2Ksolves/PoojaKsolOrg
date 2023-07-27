trigger GenerateRecordNumber on Customer__c (before insert) {
    List<Customer__c> newRecords = Trigger.new;
    for (Customer__c record : newRecords) {
        String recordNumberString = 'CUST-' + String.valueOf(System.now().getTime()).substring(0, 10);
        Decimal recordNumberDecimal = Decimal.valueOf(recordNumberString.replaceAll('[^0-9.]',''));
        record.Record_Number__c = recordNumberDecimal;
    }
}