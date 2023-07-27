public class MentorQueue implements Queueable, Schedulable{
 
    
    public void execute(QueueableContext contex){
        List<Mentor__c> menList = [select Id, Name__c from Mentor__c ];
        List<Mentor__c> upmenList = new List<Mentor__c>();
        for(Mentor__c men: menList){
            men.Name__c = 'Pooja';
            upmenList.add(men);
        }
        update upmenList;
    }
    
    public void execute(SchedulableContext cxt){
        MentorQueue mequeue = new MentorQueue();
        Id jobId = System.enqueueJob(mequeue);
    }
}