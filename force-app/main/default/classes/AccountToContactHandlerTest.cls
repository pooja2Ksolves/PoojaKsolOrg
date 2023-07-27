@isTest
public class AccountToContactHandlerTest {
    @isTest
    public static void AccountToContactHandler1() {
        Account acc = new Account();
        acc.Name = 'Test';
        acc.Rating = 'Hot';
        insert acc;
        update acc;
        
       Contact co = New Contact (AccountId = acc.Id);
                 co.LastName = 'Testing'; 
                 Insert co;
                }  
     @isTest
    public static void AccountToContactHandler2() {
        Account acc = new Account();
        acc.Name = 'Test';
        acc.Rating = 'Warm';
        insert acc;
          update acc;
        
       Contact co = New Contact (AccountId = acc.Id);
                 co.LastName = 'Testing'; 
                 Insert co;
                }       
     @isTest
    public static void AccountToContactHandler3() {
        Account acc = new Account();
        acc.Name = 'Cold';
        acc.Rating = 'Hot';
        insert acc;
          update acc;
        
       Contact co = New Contact (AccountId = acc.Id);
                 co.LastName = 'Testing'; 
                 Insert co;
                }
    
    public static void AccountToContactHandler4() {
        Account acc = new Account();
        acc.Name = 'Cold';
       
        insert acc;
          update acc;
        
      
                }       
            }