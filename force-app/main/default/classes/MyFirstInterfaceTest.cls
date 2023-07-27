@isTest
public class MyFirstInterfaceTest {
    
    @isTest
    public static void testSolveGivenLogic(){
        List<String> newList  = MyFirstInterfaceUtil.solveGivenLogic(10,20);
        System.assert(newList.size() > 0);
    }
}