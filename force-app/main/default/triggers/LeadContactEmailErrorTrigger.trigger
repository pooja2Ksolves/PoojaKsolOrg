/*.When lead is created or updated then check if the email of lead is 
 already there in existing contacts. If email already exist then throw error.*/

trigger LeadContactEmailErrorTrigger on Lead (before insert ,before update) {
LeadContactEmailErrorHandler.leadContactEmailError(trigger.new);
}