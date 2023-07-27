public class studentHisQueue implements Queueable, Schedulable{
 
    
    public void execute(QueueableContext contex){
        List<Student_History__c> stuList = [select Id, Name from Student_History__c ];
        List<Student_History__c> upstuList = new List<Student_History__c>();
        for(Student_History__c stu: stuList){
            stu.Name = 'Kajal';
            upstuList.add(stu);
        }
        update upstuList;
    }
    
    public void execute(SchedulableContext cxt){
        StudentHisQueue stqueue = new StudentHisQueue();
        Id jobId = System.enqueueJob(stqueue);
    }
}