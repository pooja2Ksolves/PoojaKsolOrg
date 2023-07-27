/*public class OutboundCall {
    @AuraEnabled(cacheable=true)
    public static Account getAccount(String AccountId){
        Account Data = [select Id, Call_Dialer_Icon__c, Phone from Account Where Id = :AccountId];
        System.debug(Data);
        return Data;
    }
}*/
public class OutboundCall {
 @AuraEnabled(cacheable=true)
    public static Account getAccount(String AccountId){
        
        Account Data = [select Id,  Call_Dialer_Icon__c, Phone from Account  Where Id =:AccountId];
        system.debug(Data);
        return Data;
    }
}