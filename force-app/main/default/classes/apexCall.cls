public class apexCall {
@InvocableMethod
    public static List<Decimal> updateAccRevenue(List<ID> Ids){
        List<Opportunity> oppList = [SELECT AccountId, Amount FROM Opportunity WHERE Id=: ids[0]];
        
        List<Account> accList = [SELECT AnnualRevenue FROM Account WHERE Id=: oppList[0].accountId];
        
        List<Decimal> annualRevenueList = new List<Decimal>();
        
       
        update accList;
        annualRevenueList.add(accList[0].AnnualRevenue);
        return annualRevenueList;
    }
}