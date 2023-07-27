/*.When lead is created or updated then check if the email of lead is 
 already there in existing contacts. If email already exist then throw error.*/

public class LeadContactEmailErrorHandler {
    public static void leadContactEmailError(List<Lead>leList){
        Map<Id ,Contact> conMap = New Map<Id ,Contact>([select Id, Name, Email from Contact]);
        For(Lead le :leList){
            If(conMap.containskey(le.Email)){
             le.addError('Duplicate Email ');   
            }  
        }
    }
}