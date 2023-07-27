public class InstituteQueue implements Queueable, Schedulable{
 
    
    public void execute(QueueableContext contex){
        List<Institute__c> inList = [select Id, Name__c from Institute__c  ];
        List<Institute__c> upinList = new List<Institute__c>();
        for(Institute__c ins: upinList){
            ins.Name__c = 'Pooja';
            upinList.add(ins);
        }
        update upinList;
    }
    
    public void execute(SchedulableContext cxt){
        InstituteQueue inqueue = new InstituteQueue();
        Id jobId = System.enqueueJob(inqueue);
    }
}