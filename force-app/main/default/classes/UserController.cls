public with sharing class UserController {
    @AuraEnabled(cacheable=true)
    public static List<User> getUsers() {
        return [SELECT Id, Name, ManagerId FROM User];
    }
}