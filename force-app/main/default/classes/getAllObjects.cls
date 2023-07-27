public with sharing class getAllObjects  {
    @AuraEnabled
     public static List<String> getAllObjects() {
        List<String> objectList = new List<String>();
        List < Schema.SObjectType > gd = Schema.getGlobalDescribe().Values();      
        for(SObjectType Obj : gd){
            objectList.add(Obj.getDescribe().getName());
        }
         //system.debug('===='+objectList);
         objectList.sort();
        return objectList;

    }
    @AuraEnabled
    public static List<String> getAllFields( String obj){
        List<String> reqFields = new List<String>();
        Map <String,Schema.SObjectType> gd = Schema.getGlobalDescribe();
        Schema.SObjectType sobjType = gd.get(obj);
        //System.debug('sobjType '+sobjType);
        Schema.DescribeSObjectResult r = sobjType.getDescribe();
        //System.debug('DescribeSObjectResult '+r);
        Map<String, Schema.SObjectField> MapofField = r.fields.getMap();
        //List<Schema.SObjectField> listofField = r.fields;
        //System.debug('MapofField '+MapofField);
        for(String keys: MapofField.keySet()){

        reqFields.add(MapofField.get(Keys).getDescribe().getName());

        }
        return reqFields;
    }
    
    
    @AuraEnabled
    public static List<sobject> queryRecord(string Fields){
        List<sobject> queryRecord = new List<sobject>();     
        queryRecord =  Database.query(Fields);
        system.debug('queryRecord' +queryRecord);
        if(queryRecord.size()> 0 ){
            return  queryRecord;
        }
        else{
            
            return null;
        }
        
    }
        

}