public class ParentCreateToChildHandler {
    public static void ParentCreateToChild(List<Parent__c>paList){
        Set<Id>idSet = new Set<Id>();
        For(Parent__c pa : paList){
          idSet.add(pa.Id);  
        }
        system.debug('idSet'+idSet);
        List<Child1__c>chList = [select Id, Quantity__c ,Parent__c from Child1__c  WHERE Parent__c = : idSet];
        system.debug('chList'+chList);
        For(Child1__c  ch :chList){
        ch.Quantity__c = ch.Quantity__c - 1;
            system.debug(' ch.Quantity__c '+ ch.Quantity__c );
        }
        update chList;
        system.debug('chList'+chList);
    }
}