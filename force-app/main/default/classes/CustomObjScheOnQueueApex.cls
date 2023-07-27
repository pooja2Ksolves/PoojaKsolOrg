public class CustomObjScheOnQueueApex {
    
   /*@AuraEnabled
    public static List<String> getCustObject(){
        List<String> custObject = new List<String>();
        Map<String, Schema.SObjectType> allCustObjects = Schema.getGlobalDescribe();    //Returns a map of all sObject names (keys) to sObject tokens (values) 
        //for the standard and custom objects defined in your organization.  
        for(String sObjTyp: allCustObjects.keySet()){
            if(sObjTyp.endsWith('__c')){
                custObject.add(allCustObjects.get(sObjTyp).getDescribe().getName());
            }
        }
        //custObject.sort();  
        return custObject;
    
    } */
    
    
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
        return objectList;
    }
}
    
    
   /* @AuraEnabled
    public static List<String> queueScheOne(String objName){
        
        if(objName.contains('Mentor__c') && objName.contains('Institute__c') && objName.contains('Student__c') && objName.contains('Student_History__c')){ //S SH M I
            MentorQueue queMen = new MentorQueue();
            //Seconds Minutes Hours DayofMonth Month DayofWeek Year
            System.schedule('Mentor Object Schedule', '0 0 8 14 11 ? 2022', queMen);
            InstituteQueue instQue = new InstituteQueue();
            System.schedule('Institute Object Schedule', '0 0 8    14 11 ? 2022', instQue);
            CustObjectQueue studentQueue = new CustObjectQueue();
            System.schedule('Student Object Schedule', '0 0 8 14 11 ? 2022', studentQueue);
            StudentHisQueue queStudHis = new StudentHisQueue();
            System.schedule('Student_History Object Schedule', '0 0 8 14 11 ? 2022', queStudHis);
        }
        else if(objName.contains('Student__c') && objName.contains('Student_History__c') && objName.contains('Mentor__c')){ //S SH M
            CustObjectQueue studentQueue = new CustObjectQueue();
            System.schedule('Student Object Schedule', '0 0 8 14 11 ? 2022', studentQueue);
            StudentHisQueue queStudHis = new StudentHisQueue();
            System.schedule('Student_History Object Schedule', '0 0 8 14 11 ? 2022', queStudHis);
            MentorQueue queMen = new MentorQueue();
            System.schedule('Mentor Object Schedule', '0 0 8 14 11 ? 2022', queMen);
        }
else if(objName.contains('Student__c') && objName.contains('Student_History__c') && objName.contains('Institute__c')){ //S SH I
            CustObjectQueue studentQueue = new CustObjectQueue();
            System.schedule('Student Object Schedule', '0 0 8 14 11 ? 2022', studentQueue);
            StudentHisQueue queStudHis = new StudentHisQueue();
            System.schedule('Student_History Object Schedule', '0 0 8 14 11 ? 2022', queStudHis);
            InstituteQueue instQue = new InstituteQueue();
            System.schedule('Institute Object Schedule', '0 0 8    14 11 ? 2022', instQue);
        }
        else if(objName.contains('Student__c') && objName.contains('Mentor__c') && objName.contains('Institute__c')){ //S M I
            CustObjectQueue studentQueue = new CustObjectQueue();
            System.schedule('Student Object Schedule', '0 0 8 14 11 ? 2022', studentQueue);
            MentorQueue queMen = new MentorQueue();
            System.schedule('Mentor Object Schedule', '0 0 8 14 11 ? 2022', queMen);
            InstituteQueue instQue = new InstituteQueue();
            System.schedule('Institute Object Schedule', '0 0 8    14 11 ? 2022', instQue);
            
        }
        else if(objName.contains('Student_History__c') && objName.contains('Mentor__c') && objName.contains('Institute__c')){ //SH M I
            StudentHisQueue queStudHis = new StudentHisQueue();
            System.schedule('Student_History Object Schedule', '0 0 8 14 11 ? 2022', queStudHis);
            MentorQueue queMen = new MentorQueue();
            System.schedule('Mentor Object Schedule', '0 0 8 14 11 ? 2022', queMen);
            InstituteQueue instQue = new InstituteQueue();
            System.schedule('Institute Object Schedule', '0 0 8    14 11 ? 2022', instQue);
        }
        else if(objName.contains('Student__c') && objName.contains('Student_History__c')){ //S SH
            CustObjectQueue studentQueue = new CustObjectQueue();
            System.schedule('Student Object Schedule', '0 0 8 14 11 ? 2022', studentQueue);
            StudentHisQueue queStudHis = new StudentHisQueue();
            System.schedule('Student_History Object Schedule', '0 0 8 14 11 ? 2022', queStudHis);
        }
        else if(objName.contains('Student__c') && objName.contains('Mentor__c')){ //S M
            CustObjectQueue studentQueue = new CustObjectQueue();
            System.schedule('Student Object Schedule', '0 0 8 14 11 ? 2022', studentQueue);
            MentorQueue queMen = new MentorQueue();
            System.schedule('Mentor Object Schedule', '0 0 8 14 11 ? 2022', queMen);
        }
        else if(objName.contains('Student__c') && objName.contains('Institute__c')){ //S I
            CustObjectQueue studentQueue = new CustObjectQueue();
            System.schedule('Student Object Schedule', '0 0 8 14 11 ? 2022', studentQueue);
            InstituteQueue instQue = new InstituteQueue();
            System.schedule('Institute Object Schedule', '0 0 8    14 11 ? 2022', instQue);
        }
else if(objName.contains('Student_History__c') && objName.contains('Mentor__c')){ //SH M 
            StudentHisQueue queStudHis = new StudentHisQueue();
            System.schedule('Student_History Object Schedule', '0 0 8 14 11 ? 2022', queStudHis);
            MentorQueue queMen = new MentorQueue();
            System.schedule('Mentor Object Schedule', '0 0 8 14 11 ? 2022', queMen);
        }
        else if(objName.contains('Student_History__c') && objName.contains('Institute__c')){ //SH I
            StudentHisQueue queStudHis = new StudentHisQueue();
            System.schedule('Student_History Object Schedule', '0 0 8 14 11 ? 2022', queStudHis);
            InstituteQueue instQue = new InstituteQueue();
            System.schedule('Institute Object Schedule', '0 0 8    14 11 ? 2022', instQue);
        }
        else if(objName.contains('Mentor__c') && objName.contains('Institute__c')){ //M I
            MentorQueue queMen = new MentorQueue();
            System.schedule('Mentor Object Schedule', '0 0 8 14 11 ? 2022', queMen);
            InstituteQueue instQue = new InstituteQueue();
            System.schedule('Institute Object Schedule', '0 0 8    14 11 ? 2022', instQue);
        }
        
        return null;
    }
}*/