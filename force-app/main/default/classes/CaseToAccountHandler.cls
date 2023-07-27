public class CaseToAccountHandler {
        public static void caseToAccount(List<Case>caList){
            Set <String> caEmail = new Set<String>();
            set<string>emailSet = new set<string>();
            List <Account> accList = new List<Account>();
            List <contact> conList = new List<contact>();
            For(Case ca : caList){
                If(ca.ContactEmail != Null){
                    emailSet.add(ca.ContactEmail);  
                }
            }
            
            
            Map<string,Account> aaMap = new Map<string,Account>();
            Map<Account,contact> accConMap = new Map<Account,contact>();
            for (Account acc : [select Id, Email_Id__c, 
                                (select id,name from contacts limit 1 )from Account  where Email_Id__c IN:emailSet ]) {
                                    
                                    
                                    aaMap.put(acc.Email_Id__c ,acc);           
                                    accConMap.put(acc,acc.contacts);           
                                    
                                    
                                }
            
           // caEmail= aaMap.keySet();
            conList = accConMap.values();
            accList = aaMap.values();
            Id accId = accList[0].Id;
            Id conId = conList[0].Id;
            aaMap.get('xxx@xxx.com');
        }
    }