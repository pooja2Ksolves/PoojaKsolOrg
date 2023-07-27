public class leadConvertAutoCtrl {
   @InvocableMethod   
    public static void LeadAssign(List<Id> LeadIds)  
    {
        List<String> conStr = new List<String>();
        List<Contact> conList = [Select Id, FirstName, LastName, Email, Phone From Contact Where Phone !=null];
        for(Contact con:conList){
            conStr.add(con.Phone);
        }
        system.debug('conStr#__11 ' + conStr);
       
       Set<String> phStr = new Set<String>(); 
        List<Lead> leadObjList = [Select Id, FirstName, LastName, Phone From Lead Where Id=:LeadIds];
        for(Lead d1:leadObjList){
            phStr.add(d1.Phone);
            if(conStr.contains(d1.Phone)){
                system.debug('do not allow duplicate phone');
                //d1.addError('do not allow duplicate phone');
            }else{
                /*Start lead convert*/ 
        LeadStatus CLeadStatus= [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true Limit 1];    
        List<Database.LeadConvert> MassLeadconvert = new List<Database.LeadConvert>();    
        for(id currentlead: LeadIds){                    
            Database.LeadConvert Leadconvert = new Database.LeadConvert();    
            Leadconvert.setLeadId(currentlead);                               
            Leadconvert.setConvertedStatus(CLeadStatus.MasterLabel);             
            Leadconvert.setDoNotCreateOpportunity(False); 
            MassLeadconvert.add(Leadconvert); 
              
        }        
       
        if (!MassLeadconvert.isEmpty())
        {            
            List<Database.LeadConvertResult> lcr = Database.convertLead(MassLeadconvert);       
        }    
      /*End lead convert*/
            }
        }
        system.debug('phStr ' + phStr);
          
    } 
}