public class CaseStatusDeleteHandler {
    public static void caseStatusDelete(List<Case>caList){
        For(Case ca :caList){
            If(ca.status == 'Open'){
             ca.addError('You Cannot Delete It');   
            }   
        }   
    }
}