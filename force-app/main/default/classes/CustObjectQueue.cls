public class CustObjectQueue implements Queueable, Schedulable{
    
    public void execute(QueueableContext contex){
        List<Student__c> studList = [SELECT Id, Name, City__c From Student__c];
        List<Student__c> upStudList = new List<Student__c>();
        for(Student__c stud: studList){
            stud.City__c = 'Nagpur';
            upStudList.add(stud);
        }
        update upStudList;
    }
    
    public void execute(SchedulableContext cxt){
        CustObjectQueue stuqueue = new CustObjectQueue();
        Id jobId = System.enqueueJob(stuqueue);
    }
    
}