public class PhraseOMatic {
    public static void main (String[] args){
        //Создайте три набора слов для выбора Добавляйте собственные слова!
        String[] wordListOne = {"сущ1", "сущ2", "сущ3", "сущ4", "сущ5", "сущ6", "сущ7", "сущ8", "сущ9", "сущ10", "сущ11", "сущ12"};
        String[] wordListTwo = {"прил1", "прил2", "прил3", "прил4", "прил5", "прил6", "прил7", "прил8", "прил9", "прил10", "прил11", "прил12", "прил13", "прил14", "прил15", "прил16", "прил17", "прил18"};
        String[] wordListThree = {"доп1", "доп2", "доп3", "доп4", "доп5", "доп6", "доп7", "доп8", "доп9", "доп10", "доп11"};
        String[] wordListFour = {"один","два","три","четыре","пять","шесть","семь","восемь","девять","десять","одинадцать","двенадцать","тринадцать","четырнадцать"};
       int i = 18;
        int cou=0;
        int cou1=0;
        int cou2=0;
        int cou3=0;
        int cou4=0;
        while(i>0) {
            // Вычисляем, сколько слов в каждом списке
            int oneLength = wordListOne.length;
            int twoLength = wordListTwo.length;
            int threeLength = wordListThree.length;
            int fourLength = wordListFour.length;
            // Генерируем три случайных числа
            int rand1 = (int) (Math.random() * oneLength);
            int rand2 = (int) (Math.random() * twoLength);
            int rand3 = (int) (Math.random() * threeLength);
            int rand4 = (int) (Math.random() * fourLength);
            //Теперь строим фразу


           if(wordListOne[rand1]!=""){
               cou++;}
            if(wordListTwo[rand2]!=""){
                cou++; }
            if(wordListThree[rand3] !=""){
                cou++; }
            if(wordListFour[rand4] !=""){
                cou++; }
            //System.out.println("cou "+cou);

            if(cou==4){
            String phrase = wordListOne[rand1] + " " + wordListTwo[rand2] + " " + wordListThree[rand3] + " " + wordListFour[rand4];
            System.out.println(i+"Bce, что нам нужно, - это " + phrase);   i=i-1;
            wordListOne[rand1]="";
            wordListTwo[rand2]="";
            wordListThree[rand3]="";
            wordListFour[rand4]="";
            cou=0;
            cou1++;
            }else if(cou==3 & cou1>10){
                String phrase = wordListOne[rand1] + " " + wordListTwo[rand2] + " " + wordListThree[rand3] + " " + wordListFour[rand4];
                System.out.println(i+"Bce, что нам нужно, - это " + phrase);   i=i-1;
                wordListOne[rand1]="";
                wordListTwo[rand2]="";
                wordListThree[rand3]="";
                wordListFour[rand4]="";
                cou=0;
                cou2++;

            }else if(cou==2 & cou2>0){
                String phrase = wordListOne[rand1] + " " + wordListTwo[rand2] + " " + wordListThree[rand3] + " " + wordListFour[rand4];
                System.out.println(i+"Bce, что нам нужно, - это " + phrase);   i=i-1;
                wordListOne[rand1]="";
                wordListTwo[rand2]="";
                wordListThree[rand3]="";
                wordListFour[rand4]="";
                cou=0;
                cou3++;
            }else if(cou==1 & cou3>1){
                String phrase = wordListOne[rand1] + " " + wordListTwo[rand2] + " " + wordListThree[rand3] + " " + wordListFour[rand4];
                System.out.println(i+"Bce, что нам нужно, - это " + phrase);   i=i-1;
                wordListOne[rand1]="";
                wordListTwo[rand2]="";
                wordListThree[rand3]="";
                wordListFour[rand4]="";
                cou=0;
                cou4++;
            }else if (cou==0 & cou4>5){
                break;
            }else{
                cou=0;
            }



        }



        }
    }

//if (wordListOne[rand1] != "" & wordListTwo[rand2] != "" & wordListThree[rand3] != "" & wordListFour[rand4] != ""){