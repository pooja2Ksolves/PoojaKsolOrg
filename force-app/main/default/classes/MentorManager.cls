@RestResource(urlMapping='/v1/MenotorManagement/')
global class MentorManager {
    @httpGet
    global static Mentor__c doGetMentor(){
        Mentor__c Mentor = new Mentor__c();
        Map<string,string> paramsMap = RestContext.request.params;
        string mentorId = paramsMap.get('Id');
        Mentor = [select Id, Name, Email__c from Mentor__c where id=:mentorId ];
        return Mentor;
    }
    @httpDelete
    global static string doDeleteMentor(){
        Mentor__c Mentor = new Mentor__c();
        Map<string,string> paramsMap = RestContext.request.params;
        string mentorId = paramsMap.get('Id');
        Mentor = [select Id, Name, Email__c from Mentor__c where id=:mentorId ];
        Delete Mentor;
        return 'recordDeleted';
        
    }
    @httpPost
    global static Mentor__c doCreateMentor(string Name){
        Mentor__c Mentor = new Mentor__c(Name= Name);
        Insert Mentor;
        return Mentor;
        
    }
    @httpPut
    global static Mentor__c doGetMentor(string Name){
        
        Map<string,string> paramsMap = RestContext.request.params;
        string mentorId = paramsMap.get('Id');
        Mentor__c Mentor = new Mentor__c(Name= Name);
        update Mentor;
        return Mentor;
    }
    
}