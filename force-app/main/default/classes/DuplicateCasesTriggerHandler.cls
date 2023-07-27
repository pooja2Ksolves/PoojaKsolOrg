public class DuplicateCasesTriggerHandler {
    public static void DuplicateCase(List<Case>cList){
        set<String>newCaseSuppliedEmailSet = New Set <String>();
        set<String>newCaseSubjectSet = New Set <String>();
        set<String>systemCaseSuppliedEmailSet = New Set <String>();
        set<String>systemCaseSubjectSet = New Set <String>();
        for(Case c :cList){
            if(c.SuppliedEmail	!= Null && c.AccountId != Null && c.ContactId != Null && c.Origin == 'Email' && c.Subject != Null){
                newCaseSuppliedEmailSet.add(c.SuppliedEmail);
                newCaseSubjectSet.add(c.Subject);
                
            }  
        }
        List <Case>caList = [select Id, Origin, SuppliedEmail, Subject, AccountId, ContactId, CreatedDate from Case where Subject IN: newCaseSubjectSet AND SuppliedEmail IN: newCaseSuppliedEmailSet ];
        for(Case caseRecord :caList){
            systemCaseSuppliedEmailSet.add(caseRecord.SuppliedEmail);
            systemCaseSubjectSet.add(caseRecord.Subject);
            
        }
        if(caList.Size() >= 1){ 
            for(Case caseRecord :cList){
                if(systemCaseSuppliedEmailSet.contains(caseRecord.SuppliedEmail) && systemCaseSubjectSet.contains(caseRecord.Subject)){
                    caseRecord.IsDuplicate__c= True;
                }                    
            }
        }
        //duplicate check for new record list
        for(Case caseRecord :cList){
            if(caseRecord.Origin == 'Email' && caseRecord.Subject != Null && caseRecord.SuppliedEmail!= Null){
                if((newCaseSuppliedEmailSet.Size() == 0 &&  newCaseSubjectSet.Size() == 0) || (!newCaseSuppliedEmailSet.contains(caseRecord.SuppliedEmail) || !newCaseSubjectSet.contains(caseRecord.Subject))){ 
                    newCaseSuppliedEmailSet.add(caseRecord.SuppliedEmail);
                    newCaseSubjectSet.add(caseRecord.Subject);
                }else{
                    caseRecord.IsDuplicate__c= True;
                }             
            }
        }
    }
}
/*public void BeforeInsert(List<SObject> newItems) {
list<Case> caseList = (List<Case>)newItems;
Set<String> newCaseSuppliedEmailSet = New Set<String>();
Set<String> newCaseSubjectSet = New Set<String>();
Set<String> systemCaseSuppliedEmailSet = New Set<String>();
Set<String> systemCaseSubjectSet = New Set<String>();
map<Id,Case> newCaseMap=new map<Id,Case>();
Boolean checkIsDomainInvalid = False;
Integer lastThreeMinitues = Integer.ValueOf(Label.Get_Last_Records);
List<Id> duplicateCaseList = New List<Id>();

for(Case c: caseList){            
if(c.SuppliedEmail != Null){
checkIsDomainInvalid = CRO_Util.checkEmailIdDomain(c);
if(checkIsDomainInvalid){
c.AccountId = Null;
c.ContactId = Null;    
}                
}
if(c.Origin == 'Email' && c.Subject != Null && c.SuppliedEmail!= Null){
newCaseSuppliedEmailSet.add(c.SuppliedEmail);
newCaseSubjectSet.add(c.Subject);            
}
}
//duplicate check for system record list
list<Case> caseLists = [SELECT Id, CreatedDate,Subject,SuppliedEmail FROM Case where Subject IN: newCaseSubjectSet AND SuppliedEmail IN: newCaseSuppliedEmailSet AND CreatedDate >= :System.now().addMinutes(-3)];       
newCaseSuppliedEmailSet.clear();
newCaseSubjectSet.clear(); 
for(Case caseRecord :caseLists){
systemCaseSuppliedEmailSet.add(caseRecord.SuppliedEmail);
systemCaseSubjectSet.add(caseRecord.Subject);   
}
if(caseLists.Size() >= 1){ 
for(Case caseRecord :caseList){
if(systemCaseSuppliedEmailSet.contains(caseRecord.SuppliedEmail) && systemCaseSubjectSet.contains(caseRecord.Subject)){
caseRecord.IsDuplicate__c= True;
}                    
}
}
//duplicate check for new record list
for(Case caseRecord :caseList){
if(caseRecord.Origin == 'Email' && caseRecord.Subject != Null && caseRecord.SuppliedEmail!= Null){
if((newCaseSuppliedEmailSet.Size() == 0 &&  newCaseSubjectSet.Size() == 0) || (!newCaseSuppliedEmailSet.contains(caseRecord.SuppliedEmail) || !newCaseSubjectSet.contains(caseRecord.Subject))){ 
newCaseSuppliedEmailSet.add(caseRecord.SuppliedEmail);
newCaseSubjectSet.add(caseRecord.Subject);
}else{
caseRecord.IsDuplicate__c= True;
}             
}
}
}*/