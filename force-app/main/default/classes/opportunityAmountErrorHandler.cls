public class opportunityAmountErrorHandler {
    public static void opportunityAmountError(List<Opportunity>oppList){
        For(Opportunity opp :oppList){
            If(opp.Amount<10000){
               opp.Amount.addError('Amount Should be greater than 10000'); 
            } 
        }
    }
}