trigger AccountEncryption on Account (before insert, before update) {
    for (Account account : Trigger.new) {
        account.EncryptionPhone__c = EncryptionUtil.encrypt(account.Phone);
    }
}