public class GetChild {
@AuraEnabled
    public static List<Account> getContactDetail(){
     List<Account> accList = [Select Id,Name,(Select Name,FirstName,LastName from contacts)
                             From Account LIMIT 3]; 
        if(!accList.isEmpty()){
            return accList;
        }
        return null;
    }
}