/*Trigger code We need to restrict the user to delete the account 
 which has related contact*/
public class restrictUserToDeleteAccountHandler {
    public static void restrictUserToDeleteAccount(List<Account>accList){
       List<Account>acList =[ SELECT Id ,Name,(SELECT Id,Name From Contacts) from Account WHERE ID IN:accList];
        For(Account ac :acList){
            If(ac.Contacts.Size()>0){
              ac.addError('You Cannot Delete It');  
            }
        }  
    }
}