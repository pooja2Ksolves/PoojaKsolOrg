public class MyFirstInterfaceUtil implements MyFirstInterface{

    public static List<String> solveGivenLogic(Integer starting, Integer ending){
        List<String> listToReturn = new List<String>();
        for(Integer i= starting; i<ending; i++){
            String str = ((math.mod(i, 3) == 0 && math.mod(i, 5) == 0) ? 'Three&Five' : math.mod(i, 3) == 0 ? 'Three' : ( math.mod(i, 5) == 0 ? 'Five':  String.valueOf(i)));
            listToReturn.add(str);
        }
        System.debug('listToReturn '+listToReturn);
        return listToReturn;
    }
}