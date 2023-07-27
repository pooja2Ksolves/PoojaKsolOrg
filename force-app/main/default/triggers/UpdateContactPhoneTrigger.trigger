trigger UpdateContactPhoneTrigger on Account (after update) {
    List<Contact> contactsToUpdate = new List<Contact>();
    
    for (Account acc : Trigger.new) {
        Account oldAccount = Trigger.oldMap.get(acc.Id);
        
        // Check if the phone field is updated on the account
        if (acc.Phone != oldAccount.Phone) {
            // Retrieve the related contacts
            List<Contact> relatedContacts = [SELECT Id, AccountId FROM Contact WHERE AccountId = :acc.Id];
            
            // Update the phone field on the contacts
            for (Contact con : relatedContacts) {
                con.Phone = acc.Phone;
                contactsToUpdate.add(con);
            }
        }
    }
    
    // Perform bulk update on the contacts
    if (!contactsToUpdate.isEmpty()) {
        update contactsToUpdate;
    }
}