/*If Active field on the Account is updated to False.
Validation - 
Account should not be updated to Active if it has any Case that is in Escalated Status.
Error Message for Validation - There are some escalated cases for this account. Please close them first.

Description :- This trigger is applied on Account Object to Validate Account Field and to update case status to close
Author :- Pooja Chamanlal Rahngdale
Created Date :- 24-11-2022
LastModified Date :-24-11-2022
LastModified By :- Pooja Chamanlal Rahangdale*/
public class AccountValidateIfNotActiveClass {
    Public static void AccountValidateIfNotActiveCaseEscalatedMethod(List<Account> accList){
       Map<Id, Account> accValiMap = new Map<Id, Account>([Select Id, (Select Id, Status from Cases where Status = 'Escalated') from Account where Id IN : accList]);
        try{
            for(Account acco : accList){
                if((acco.Active__c == 'Yes') && (accValiMap.get(acco.Id).Cases.size() != 0)){
                    acco.Active__c.adderror('There are some escalated cases for this account. Please close them first.');
                }
            } 
        }
        catch(Exception ex){
            System.debug('Exception :- ' + ex.getMessage() + 'Line No. :' + ex.getLineNumber());
        } 
    }
}