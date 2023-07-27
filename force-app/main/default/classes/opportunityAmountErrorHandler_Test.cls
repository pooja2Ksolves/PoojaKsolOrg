@isTest
public class opportunityAmountErrorHandler_Test {
@isTest
   public static void opportunityAmountError(){
        List<Opportunity>oppList = new List<Opportunity>();
        For(Integer i = 0; i<5;i++){
         Opportunity op = new Opportunity();
            op.Name = 'Test'+i;
            op.CloseDate = system.today();
            op.StageName = 'Qualification';
            op.Amount = 50;
            
            oppList.add(op);
            Insert oppList;
            
    
}
            Test.startTest();
            
            
            Test.stopTest();
            
            List<Opportunity>UpdatedOppList = [SELECT Id,Name,CloseDate,StageName,Amount FROM Opportunity WHERE Id =:oppList[0].Id];
            
           system.assert(False, 'Amount Should be greater than 10000');
        }
    }