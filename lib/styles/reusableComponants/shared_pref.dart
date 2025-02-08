import 'package:islami/ui/home/service/sura-obj-List.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../ui/home/widgets/suraclass.dart';

class PrefHelper{
  static  late SharedPreferences prefs;
  static init()async{
     prefs=await SharedPreferences.getInstance();
  }
  static setBool (bool isFirstTime){
    prefs.setBool("firstTime", true);
  }
  static getBool(){
  return  prefs.getBool("firstTime");
  }
  static addToList(List<SuraModel>suraList){
    List<String>suraStringList=suraList.map((sura) =>sura.suraNameEn ).toList();
    prefs.setStringList("mostRecent",suraStringList );
  }
  static List<SuraModel> getFromList(){
    List<String> mostStringList= prefs.getStringList("mostRecent")??[];
    List<SuraModel> filterMostStringList=[];
    for (String suraName in mostStringList){
      SuraModel foundSura  = suraList.firstWhere((sura) => sura.suraNameEn==suraName);
      filterMostStringList.add(foundSura);



    }
   return  filterMostStringList;

  }

}
/*
  * shared pref using singleton design pattern for create obj
  * it usen if you want to create one constructor to your whole program (not every calling create obj  )
  * just one constructor if it created before it just use it else crean new one
  * that's cause you just need one const with one pointer to set and get data from(one const have app cache)
  * how singleton design pattern build ?
  * class Person {
 static late Person _instance;//we make privet var to have named privet const
 Person._Instanse();we create namet privet const and to delete default const
  static getInstanse(){ we creat getter fun to get the only privet const and val it every time need to call constractor
    _instance=Person._Instanse();

  }
}
  * */
