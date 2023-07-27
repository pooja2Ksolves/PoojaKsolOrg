/*Trigger code We need to restrict the user to delete the account 
 which has related contact*/
trigger restrictUserToDeleteAccount on Account (before delete) {
restrictUserToDeleteAccountHandler.restrictUserToDeleteAccount(trigger.new);
}