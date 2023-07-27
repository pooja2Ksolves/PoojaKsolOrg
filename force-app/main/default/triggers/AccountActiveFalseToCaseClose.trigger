/*
When Account is Deactivated by updating its Active field to False
All of the Cases for this Account should be closed by updating their Status field to Closed if those are not in the Escalated Status.


Description :- This trigger is applied on Account Object depending upon the value of active feild  update case status to close  if  it is not in the Escalated Status.

Author :- Pooja Chamanlal Rahangdale
Created Date :- 24-11-2022
LastModified Date :-24-11-2022
LastModified By :- Pooja Chamanlal Rahangdale
*/
trigger AccountActiveFalseToCaseClose on Account (after update) {
AccountActiveFalseToCaseCloseHandler.AccountActiveFalseToCaseClosemethod(trigger.new,trigger.oldMap);
}