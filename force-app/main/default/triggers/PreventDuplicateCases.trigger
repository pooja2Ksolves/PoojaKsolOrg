trigger PreventDuplicateCases on EmailMessage (before insert) {
    Set<String> emailMessageIds = new Set<String>();
    List<Case> existingCases = new List<Case>();
    List<EmailMessage> newEmailMessages = new List<EmailMessage>();
    
    // Get the Email Message IDs of the new Email Messages being inserted
    for (EmailMessage emailMessage : Trigger.new) {
        emailMessageIds.add(emailMessage.MessageIdentifier);
    }
    
    // Check if there are any existing Cases with the same Email Message ID
    if (!emailMessageIds.isEmpty()) {
        existingCases = [SELECT Id, SourceId FROM Case WHERE SourceId IN :emailMessageIds];
    }
    
    // Create a list of new Email Messages to insert and remove any duplicates
    for (EmailMessage emailMessage : Trigger.new) {
        if (!existingCases.isEmpty() && existingCases[0].SourceId == emailMessage.MessageIdentifier) {
            Trigger.newMap.get(emailMessage.Id).addError('A case already exists for this email');
        } else {
            newEmailMessages.add(emailMessage);
        }
    }
    
    // Replace the Trigger.new list with the list of new Email Messages without duplicates
    //Trigger.new = newEmailMessages;
}