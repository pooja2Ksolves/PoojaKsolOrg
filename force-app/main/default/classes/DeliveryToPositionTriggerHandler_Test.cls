@isTest
public class DeliveryToPositionTriggerHandler_Test {
    @isTest
    public static void DeliveryToPositionTrigger(){
        
        Child1__c ch = new Child1__c();
        ch.Name = 'Test';
        ch.Delivery_Days__c = 2;
        ch.Position__c = 'L2';
        insert ch;
        update ch;
    }

}