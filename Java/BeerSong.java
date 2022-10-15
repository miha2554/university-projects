public class BeerSong {
    public static void main(String[] args){
        int beerNum= 99;
        int beerNum1=(int)((Math.random())*10);
        String word = "бутылок (бутылки)" ;
        while(beerNum>0){
            if(beerNum==1){
                word = "бутылка";
            }
            System.out.println(beerNum+" "+word+" пива на стене");
            System.out.println(beerNum+" "+word+" пива.");
            System.out.println("Возьми "+beerNum1);
            System.out.println("Пусти по кругу.");
            beerNum=beerNum-beerNum1;

            beerNum1=(int)((Math.random())*10);

            if(beerNum>0){
                System.out.println();
            }else{
                System.out.println("Нет бутылок на стене");
            }
        }
    }
}
