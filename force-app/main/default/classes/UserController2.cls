public with sharing class UserController2 {
    @AuraEnabled(cacheable=true)
    public static List<HierarchicalUser> getUserHierarchy() {
        List<User> users = [SELECT Id, Name, ManagerId FROM User WHERE IsActive = true];
        Map<Id, HierarchicalUser> userMap = new Map<Id, HierarchicalUser>();
        for (User user : users) {
            HierarchicalUser hierarchicalUser = new HierarchicalUser(user.Id, user.Name);
            userMap.put(hierarchicalUser.userId, hierarchicalUser);
        }
        for (User user : users) {
            if (user.ManagerId != null) {
                HierarchicalUser hierarchicalUser = userMap.get(user.Id);
                HierarchicalUser hierarchicalManager = userMap.get(user.ManagerId);
                if (hierarchicalUser != null && hierarchicalManager != null) {
                    hierarchicalManager.subordinates.add(hierarchicalUser);
                }
            }
        }
        List<HierarchicalUser> rootUsers = new List<HierarchicalUser>();
        for (User user : users) {
            HierarchicalUser hierarchicalUser = userMap.get(user.Id);
            if (hierarchicalUser != null && hierarchicalUser.manager == null) {
                rootUsers.add(hierarchicalUser);
            }
        }
        return rootUsers;
    }

    public class HierarchicalUser {
        public Id userId;
        public String name;
        public HierarchicalUser manager;
        public List<HierarchicalUser> subordinates;

        public HierarchicalUser(Id userId, String name) {
            this.userId = userId;
            this.name = name;
            this.subordinates = new List<HierarchicalUser>();
        }
    }
}