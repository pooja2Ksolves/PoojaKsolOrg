public class caseTriggerHandler {
    public static void caseTrigger(List<Case>calist,Map<Id,Case>caMap){
        For(Case ca :calist){
            If(ca.Case_Genre__c== 'Service Request' && ca.status == 'Awaiting customer confirmation' && caMap.get(ca.Id).status != 'Awaiting customer confirmation'){
              ca.Date_Time_Customer_Confirmation__c = DateTime.now();	  
            }    
        }  
    }
}