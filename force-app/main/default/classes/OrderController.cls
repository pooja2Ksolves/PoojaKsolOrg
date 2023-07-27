public with sharing class OrderController {
    @AuraEnabled(cacheable=true)
    public static List<Order> searchOrders(String searchQuery) {
        // Query orders based on the search query
        String query = 'SELECT Id, OrderNumber, Account.Name FROM Order WHERE OrderNumber LIKE \'%' + searchQuery + '%\'';
        return Database.query(query);
    }
}