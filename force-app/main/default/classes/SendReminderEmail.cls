public with sharing class SendReminderEmail {
    @InvocableMethod
    public static void sendReminder(List<Id> caseIds) {
        // Query the cases
        List<Case> cases = [SELECT Id, Subject, Description, Contact.Email FROM Case WHERE Id IN :caseIds];
        
        // Create a list to hold the email messages
        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
        
        // Iterate through the cases
        for (Case c : cases) {
            // Create a new email message
            If(c.Status == 'Open'){
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            
            // Set the recipient
            email.setToAddresses(new String[] {c.Contact.Email});
            
            // Set the subject and body of the email
            email.setSubject('Reminder: Case ' + c.Id + ' - ' + c.Subject);
            email.setPlainTextBody('This is a reminder for case ' + c.Id + ' - ' + c.Subject + ': ' + c.Description);
            
            // Add the email to the list
            emails.add(email);
        }
        
        // Send the emails
        Messaging.sendEmail(emails);
        }
    }
}