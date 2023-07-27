/*
Description : Test class for trigger on student__c Object
Author : Pooja Rahangdale
Created Date : 06-12-2022
Last Modified Date : 06-12-2022
*/
@isTest
public class StudentBackupCityPinCodeHandler_Test {
    @isTest
    Public static void studentBackupCityPinCodeHandler(){
        List<student__c>stuList = new List<student__c>();
        
        student__c St = new student__c();
        St.Name = 'Test';
        St.New_City__c = 'Pune';
        St.New_Pin_Code__c = 440006;
        St.Old_City__c = 'Nagpur';
        St.Old_Pin_Code__c = 440008;
        stuList.add(St);
        
        //Insert stuList;
        
        //Test.startTest();
        Insert stuList;
        //Test.stopTest();
        
        //List<student__c>UpdatedcaList = [Select Id, Name, Old_City__c, New_City__c, New_Pin_Code__c, Old_Pin_Code__c from student__c WHERE Id =:stuList[0].Id];
        
        //system.assertEquals('Nagpur', UpdatedcaList[0].Old_City__c);
        //system.assertEquals(440008, UpdatedcaList[0].Old_Pin_Code__c);
    }
}