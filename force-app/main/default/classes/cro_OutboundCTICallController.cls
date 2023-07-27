public class cro_OutboundCTICallController {
    @AuraEnabled(cacheable=true)
    public static Account getAccountRecord(String AccountId) {
        Account data = [SELECT Id, Phone,Phone2__c,View_Number_Counter__c,	View_NumberReason__c FROM Account WHERE id =: AccountId];
        system.debug(data);
        return data;
    }
    @AuraEnabled
    public static Integer updateOutboundCallCounter(String recId) {
        try {
            Account accRec = [SELECT Id, Phone, Phone2__c, View_Number_Counter__c, User_Outbound_Call_Detail__c FROM Account WHERE id =: recId limit 1];
            accRec.View_Number_Counter__c = accRec.View_Number_Counter__c == Null ? 1 : accRec.View_Number_Counter__c + 1;  
            accRec.User_Outbound_Call_Detail__c = UserInfo.getName() + ', ' + System.now().format('yyyy-MM-dd hh:mm a');
            update accRec;
            return (Integer)accRec.View_Number_Counter__c;
        } catch(Exception ex) {
          //  CRO_HandleException.LogException(ex);
            return null; 
        }
    }
    
}