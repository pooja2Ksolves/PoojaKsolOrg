public with sharing class TaskListController {
    @AuraEnabled(cacheable=true)
    public static List<Task> getTaskList() {
        return [SELECT Id,Subject, ActivityDate, What.Name, WhatId, OwnerId,Owner.Name FROM Task LIMIT 10];
    }
}