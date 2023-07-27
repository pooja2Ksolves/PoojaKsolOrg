/*If Active field on the Account is updated to False.
Validation - 
Account should not be updated to Active if it has any Case that is in Escalated Status.
Error Message for Validation - There are some escalated cases for this account. Please close them first.

Description :- This trigger is applied on Account Object to Validate Account Field and to update case status to close
Author :- Pooja Chamanlal Rahngdale
Created Date :- 24-11-2022
LastModified Date :-24-11-2022
LastModified By :- Pooja Chamanlal Rahangdale*/
trigger AccountValidateIfNotActiveCaseEscalated on Account (before update) {
    if(trigger.isBefore && trigger.isUpdate){
        AccountValidateIfNotActiveClass.AccountValidateIfNotActiveCaseEscalatedMethod(trigger.new);
    }
}