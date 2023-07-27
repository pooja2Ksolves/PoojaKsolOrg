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
trigger StudentBackupCityPinCodeTrigger on student__c (before update) {
StudentBackupCityPinCodeHandler.studentBackupCityPinCode(Trigger.New);
}