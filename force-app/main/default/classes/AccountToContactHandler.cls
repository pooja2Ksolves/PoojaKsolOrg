public class AccountToContactHandler {
    public static void AccountToContact(List<Account>accList){
        List<Contact>coList = New List<Contact>();
        For(Account acc : accList){
            If(acc.Rating == 'Hot'){
                For( Integer i=1 ; i <=5 ; i++){
                 Contact co = New Contact (AccountId = acc.Id);
                 co.LastName = 'Test' +i;
                   coList.add(co); 
                }       
            }
            If(acc.Rating == 'Warm'){
                For( Integer i=1; i <=7 ; i++){
                 Contact co = New Contact (AccountId = acc.Id);
                 co.LastName = 'Test' +i;
                   coList.add(co); 
                }       
            }
            If(acc.Rating == 'Cold'){
                For( Integer i=1 ; i <=9 ; i++){
                 Contact co = New Contact (AccountId = acc.Id);
                 co.LastName = 'Test' +i;
                   coList.add(co); 
                }       
            }
        }
        Insert coList;
    }
}