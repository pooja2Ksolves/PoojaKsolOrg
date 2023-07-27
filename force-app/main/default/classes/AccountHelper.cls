public class AccountHelper {
    @AuraEnabled(cacheable = true)
    Public static List<Account> getAccountList(){
       return [SELECT Name, Site, BillingState, Phone, Type, Owner.Name FROM Account] ;
    }
}