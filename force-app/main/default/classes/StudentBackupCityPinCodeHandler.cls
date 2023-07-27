/*
 Maintain student object’s history. (Triggers)
1. On every record update, the updated field’s value should be recorded.
2. This should also work when multiple fields are updated at once.
3. Maintain every custom field’s history in the Student_History__c object.
4. Field’s name should not be hardcoded in the code, Use Metadata API which provides
the object’s field details, use it to get the field’s name and value.
Description :- This trigger is applied on student__c Object to Backup the old pinCode and city value
Author :- Pooja Chamanlal Rahngdale
Created Date :- 06-12-2022
LastModified Date :-06-12-2022
LastModified By :- Pooja Chamanlal Rahangdale
*/

public class StudentBackupCityPinCodeHandler {
    Public static void studentBackupCityPinCode(List<student__c>StuList){
        Map<Id ,student__c>stuMap = New Map<Id ,student__c>([Select Id, Name, Old_City__c, New_City__c, New_Pin_Code__c, Old_Pin_Code__c from student__c ]);
        For(student__c Stu :StuList){
            If((stu.New_Pin_Code__c != stuMap.get(Stu.Id).Old_Pin_Code__c)&&(stu.New_City__c != stuMap.get(Stu.Id).Old_City__c)){
            stu.Old_City__c = stuMap.get(Stu.Id).New_City__c;
            stu.Old_Pin_Code__c = stuMap.get(Stu.Id).New_Pin_Code__c;
            }
        }  
    }
}