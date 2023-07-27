public class AllCustomObjectHandler {
    @AuraEnabled
    public static List<String> getAllObjects() {
        List<String> objectList = new List<String>();
        List < Schema.SObjectType > gd = Schema.getGlobalDescribe().Values();      
        for(SObjectType Obj : gd){
            if(obj.getDescribe().isCustom()){
                objectList.add(Obj.getDescribe().getName());
            }
        }
        system.debug('All Custom Object Are'+objectList);
        objectList.sort();
        system.debug('objectList');
        system.debug('objectList11'); 
                system.debug('objectList11');


        return objectList;
    }
}
