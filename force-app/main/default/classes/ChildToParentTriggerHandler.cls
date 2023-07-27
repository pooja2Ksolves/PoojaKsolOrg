public class ChildToParentTriggerHandler {
    public static void ChildToParent(List<Child1__c>chList){
        Set<Id>idSet = New Set<Id>();
        For(Child1__c ch :chList){
          idSet.add(ch.Parent__c);  
        }
        system.debug('idSet'+idSet);
        List<Parent__c>paList = [select id,Quantity__c from Parent__c WHERE Id = :idSet];
         system.debug('paList'+paList);
        For(Parent__c pa :paList){
          pa.Quantity__c = pa.Quantity__c - 1;
             system.debug('pa.Quantity__c'+pa.Quantity__c);
        }
        Update paList;
    }
}