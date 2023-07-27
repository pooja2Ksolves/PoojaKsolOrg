@isTest
public class ChildToParentTriggerHandler_Test {
@isTest
    public static void ChildToParentTriggerHandler(){
        Parent__c pa = New Parent__c();
        pa.Name = 'Test';
        insert pa;
        
        Child1__c ch = New Child1__c (Parent__c = pa.Id);
        ch.Name = 'Test1';
        Insert ch;
    }
}