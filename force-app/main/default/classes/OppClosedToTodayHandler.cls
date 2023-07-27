/*When oppertunity stage is changed to closed won we need to update 
 closed date to today.*/
public class OppClosedToTodayHandler {
    public static void OppClosedToToday(List<Opportunity>opList , Map<Id,Opportunity>opMap){
        For(Opportunity op :opList){
            If(op.StageName == 'Closed Won' && opMap.get(op.Id).StageName != 'Closed Won'){
             op.CloseDate = Date.valueOf(System.now());   
            }    
        }  
    }
}