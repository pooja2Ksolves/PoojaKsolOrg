/*public class DeliveryToPositionTrigger2Handler {
    public static void DeliveryToPositionTrigger2(List<Child1__c>chList){
        Integer childSize;
        Decimal DeliveryDay;
        Decimal DeliverySum;
        Set<Id>idSet = New Set<Id>();
        For(Child1__c ch :chList){
            If(ch.Parent__c != Null){
             idSet.add(ch.Parent__c);   
            }   
        }
        List<Parent__c>paList = [Select id,Name,(Select Id,Name,Delivery_Days__c From Child1s__r) From Parent__c Where Id = :idSet];
        For(Parent__c pa :paList){
          
            For(Child1__c ch :pa.Child1s__r){
              childSize = pa.Child1s__r.size();
                DeliveryDay= ch.Delivery_Days__c;
               
            } 
        }
    }
}*/

public class DeliveryToPositionTrigger2Handler {
    public static void DeliveryToPositionTrigger2(List<Child1__c> chList) {
        Integer childSize = 0;
        Decimal DeliverySum = 0;
        Set<Id> idSet = new Set<Id>();
        
        for (Child1__c ch : chList) {
            if (ch.Parent__c != null) {
                idSet.add(ch.Parent__c);
            }
        }
        
        List<Parent__c> paList = [SELECT Id, Name, (SELECT Id, Name, Delivery_Days__c FROM Child1s__r) FROM Parent__c WHERE Id IN :idSet];
        
        for (Parent__c pa : paList) {
            childSize = pa.Child1s__r.size();
            system.debug('childSize'+childSize);
            
            for (Child1__c ch : pa.Child1s__r) {
                if(DeliverySum != Null)
                DeliverySum += ch.Delivery_Days__c;
                system.debug('DeliverySum'+DeliverySum);
            }
        }
    }
}