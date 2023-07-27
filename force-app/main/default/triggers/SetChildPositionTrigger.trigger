trigger SetChildPositionTrigger on Child1__c (before insert, before update) {
    // Collect Parent__c IDs
    Set<Id> parentIds = new Set<Id>();
    for (Child1__c child : Trigger.new) {
        if (child.Parent__c != null) {
            parentIds.add(child.Parent__c);
        }
    }
    
    // Query Parent__c records and their associated Child1__c records
    Map<Id, Parent__c> parentMap = new Map<Id, Parent__c>(
        [SELECT Id, (SELECT Id, Delivery_Days__c FROM Child1s__r ORDER BY Delivery_Days__c DESC) FROM Parent__c WHERE Id IN :parentIds]
    );
    
    // Iterate over Child1__c records to set position based on delivery day
    for (Child1__c child : Trigger.new) {
        if (child.Parent__c != null) {
            Parent__c parent = parentMap.get(child.Parent__c);
            Integer position = 1;
            
            // Find the position based on delivery day
            for (Child1__c associatedChild : parent.Child1s__r) {
                if (child.Id == associatedChild.Id) {
                    break;  // Stop when we reach the current child
                }
                
                position++;
            }
            
            // Set position field
            child.Position__c = 'L' + position;
        }
    }
}