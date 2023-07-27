trigger SetVisitSequence on Contact (after insert) {
    List<Contact> contactsToUpdate = new List<Contact>();
    for (Contact c : Trigger.new) {
        Id accountId = c.AccountId;
        List<Contact> existingContacts = [SELECT Id FROM Contact WHERE AccountId = :accountId ORDER BY CreatedDate ASC];
        Integer index = existingContacts.indexOf(c);
        c.Visit_Sequence__c = String.valueOf(index + 1); // convert the integer value to string
        contactsToUpdate.add(c);
    }
    update contactsToUpdate;
}