public class vlog_OrderSearch {
@AuraEnabled(Cacheable = true)
    public static list<Order> getOrderData(String numberkey) {
        numberkey = '%' + numberkey + '%';
        list<Order> ordLst = [SELECT  Id, Order_No__c, Account.Name, EffectiveDate, Status From Order WHERE Order_No__c LIKE :numberkey];
        
        if(ordLst.isEmpty()) {
            throw new AuraHandledException('No Record Found..');
        }
        return ordLst; 
    }
}