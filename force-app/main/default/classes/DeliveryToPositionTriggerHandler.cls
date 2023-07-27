public class DeliveryToPositionTriggerHandler {
    public static void DeliveryToPosition(List<Child1__c>chList){
       set<Id>idSet = new set<Id>();
        Integer childSize;
        For(Child1__c ch :chList){
         idSet.add(ch.parent__c);   
        }
        List<parent__c> paList = [Select id,Name,(Select id,name From child1s__r) From parent__c Where Id =:idSet];
        For(parent__c pa :paList){
            For(Child1__c ch :pa.child1s__r){
                childSize = pa.child1s__r.size();
                For(Integer i = 0; i<= childSize; i++ ){
                    
                }   
            }    
        }
    }
}