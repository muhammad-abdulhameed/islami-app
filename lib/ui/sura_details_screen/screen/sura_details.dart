import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/styles/assetsManger.dart';
import 'package:islami/styles/colorManeger.dart';
import 'package:islami/styles/reusableComponants/textComponent.dart';
import 'package:islami/styles/stringsManger.dart';
import 'package:islami/ui/home/widgets/suraclass.dart';

class SuraDetails extends StatefulWidget {
  static String routeName = "SuraDetails";

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  String suraTxt = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SuraModel suraModel =
        ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (suraTxt.isEmpty) {
      //that's to dont call load file every time build called
      loadFiles(suraModel.suraNumber);
    }
    /* loadFiles(); if we call this function in build go throw cycle dpendancy cause build fun called many times (SetState) and call this function every time (load files and print every setState)  */
    return Scaffold(
      backgroundColor: ColorsManger.secondary,
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorsManger.primary),
        backgroundColor: Colors.transparent,
        title: Text(suraModel.suraNameEn,
            style: TextStyle(
                fontFamily: StringManger.fontJanna,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: ColorsManger.primary)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 19),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(ImagesManger.leftCorner),
                Expanded(
                    child: Text(
                  suraModel.suraNameAr,
                  style: TextStyle(color: ColorsManger.primary, fontSize: 20),
                  textAlign: TextAlign.center,
                )),
                Image.asset(ImagesManger.rightCorner),
              ],
            ),
            Expanded(//Expanded cause scsv need available space to work
              child: SingleChildScrollView(//make it scrollable to make  (Row) fixed while scrolling

                child:suraTxt==""?Center(child: CircularProgressIndicator(color: ColorsManger.primary,)): Text(
                  suraTxt,
                  style: TextStyle(
                    color: ColorsManger.primary,
                    fontSize: 20,
                  ),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  loadFiles(int suraNum) async {

    suraTxt = await rootBundle.loadString(
        "assets/files/suratxt/${suraNum}.txt"); /*rootBundle it's class used to load files bundled in yor app*/

    List <String>ayaNum = suraTxt.split("\n");///split function that's split string from some pattern you choose then add splited value to list of string
    String temp="";//cause we can't concat with item in list we declare this var to have the value we want to concat
   /* for(int i = 0; i < ayaNum.length; i++){

        temp+="${i+1}";///not working as expected
        temp+=ayaNum[i].trim();
        suraTxt=temp;

    }
*/
    for(int i = 0; i < ayaNum.length; i++){
      if (i==0){//to don't start from 0

        temp+=ayaNum[i].trim();///trim is function that's remove any space
        suraTxt=temp;
      }else if(i==ayaNum.length){
        temp+="(${(i+1).toString()})";///here we initial the temp var with value we want to concat
        temp+=ayaNum[i].trim();///here we do concatenation by list value by a value we want to concat
        suraTxt=temp;///then we assign widget value by final value(after concatenate)
      }else{
        temp+="(${(i).toString()})";
        temp+=ayaNum[i].trim();
        suraTxt=temp;
      }



    }
   /* for(int i = 0; i < ayaNum.length; i++){
      ayaNum[i]+="${(i+1).toString()}";///can't concatenate to index of list to solve that Above
      suraTxt=ayaNum[i];

    }*/
    setState(() {});
  }
}
