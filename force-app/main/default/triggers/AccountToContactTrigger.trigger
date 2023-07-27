trigger AccountToContactTrigger on Account (after update,after insert) {
AccountToContactHandler.AccountToContact(trigger.new);
}