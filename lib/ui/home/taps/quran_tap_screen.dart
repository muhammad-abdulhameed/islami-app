import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/styles/assetsManger.dart';
import 'package:islami/styles/colorManeger.dart';
import 'package:islami/styles/reusableComponants/shared_pref.dart';
import 'package:islami/styles/reusableComponants/textComponent.dart';
import 'package:islami/styles/stringsManger.dart';
import 'package:islami/ui/home/service/sura-obj-List.dart';
import 'package:islami/ui/home/widgets/suraWidget.dart';
import 'package:islami/ui/home/widgets/suraclass.dart';
import 'package:islami/ui/sura_details_screen/screen/sura_details.dart';

import '../service/surasLists.dart';

class QuranTap extends StatefulWidget {
  QuranTap({super.key});

  @override
  State<QuranTap> createState() => _QuranTapState();
}

class _QuranTapState extends State<QuranTap> {
  int suraIndex = 0;
  String searchString="";

  List<SuraModel> recentlySura = PrefHelper.getFromList();
  List<SuraModel> searchSura=[];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImagesManger.quranBackground),
                fit: BoxFit.fill)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SafeArea(
                  child: Image.asset(
                ImagesManger.appLogo,
                height: MediaQuery.of(context).size.height * .20,
                alignment: Alignment
                    .topCenter /*to make image little top cause column make it little down*/,
              )),
              TextField(
                onChanged: (value) {
                  setState(() {
                    searchString=value;
                    search(value.toLowerCase());

                  });
                },
                textAlignVertical: TextAlignVertical.center,
                /*that's to control input text align*/
                decoration: InputDecoration(
                  isCollapsed: true,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  hintText: StringManger.hintText,
                  hintStyle: TextStyle(
                      fontFamily: "janna",
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: ColorsManger.OffWhite),
                  prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14,
                      ),
                      child: SvgPicture.asset(
                        ImagesManger.quranLogo,
                      )),
                  prefixIconConstraints: BoxConstraints(
                    maxHeight: 56,
                    maxWidth: 56,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: ColorsManger.primary)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: ColorsManger.primary)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            if(searchString.isEmpty)///there's on case to make condition in constractor (condition with out body the con will be in just on second element only )
            ...[///to add list in list use ...
              TextComponent(
                text: StringManger.mostRecently,
              ),
              Expanded(
                flex: 1,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                          color: ColorsManger.primary,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 17),
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  recentlySura[index].suraNameEn,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24,
                                      fontFamily: StringManger.fontJanna,
                                      color: ColorsManger.secondary),
                                ),
                                Text(recentlySura[index].suraNameAr,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24,
                                        fontFamily: StringManger.fontJanna,
                                        color: ColorsManger.secondary)),
                                Text(recentlySura[index].versesNumber,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        fontFamily: StringManger.fontJanna,
                                        color: ColorsManger.secondary)),
                              ],
                            ),
                          ),
                          Image.asset(ImagesManger.quCard)
                        ],
                      ),
                    ),
                    separatorBuilder: (context, index) => SizedBox(width: 10),
                    itemCount: recentlySura.length),
              ),
            ],
              TextComponent(text: StringManger.surasList),
              Expanded(
                flex: 2,
                child: ListView.separated(
                  itemCount:searchString.isEmpty?suraList.length :searchSura.length ,///we make condition if search empty depends on on building sura list else search list
                  itemBuilder: (context, index2) => SuraWidget(suraModel:searchString.isEmpty? suraList[index2]:searchSura[index2]
                    ,onSuraTap: onSuraTap,),
                  separatorBuilder: (context, index) => Divider(
                      height: 30,
                      color: ColorsManger.OffWhite,
                      endIndent: 30,
                      indent: 30),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void onSuraTap(SuraModel suraModel){
    Navigator.of(context).pushNamed(SuraDetails.routeName,arguments: SuraModel(suraNameEn: suraModel.suraNameEn,
        suraNameAr: suraModel.suraNameAr,
        versesNumber: suraModel.versesNumber,
        suraNumber: suraModel.suraNumber));


  for(int i=0;i<recentlySura.length;i++){
    if(recentlySura[i].suraNameEn==suraModel.suraNameEn ){
      recentlySura.removeAt(i);
    }


  }

  setState(() {
    recentlySura.insert(
        0,
        SuraModel(
            suraNameEn: suraModel.suraNameEn,
            suraNameAr: suraModel.suraNameAr,
            suraNumber: suraModel.suraNumber,
            versesNumber: suraModel.versesNumber));
    PrefHelper.addToList(recentlySura);
  });





    /*  if (recentlySura.isEmpty) {
        setState(() {
          recentlySura.add(SuraModel(
              suraNameEn: suraModel.suraNameEn,
              suraNameAr: suraModel.suraNameAr,
              suraNumber: suraModel.suraNumber,
              versesNumber: suraModel.versesNumber));
        });
      } else if (!recentlySura.any((element) =>
      element ==
          SuraModel(
              suraNameEn: suraModel.suraNameEn,
              suraNameAr: suraModel.suraNameAr,
              suraNumber: suraModel.suraNumber,
              versesNumber: suraModel.versesNumber))) {

        setState(() {
          recentlySura.insert(
              0,
              SuraModel(
                  suraNameEn: suraModel.suraNameEn,
                  suraNameAr: suraModel.suraNameAr,
                  suraNumber: suraModel.suraNumber,
                  versesNumber: suraModel.versesNumber));
        });
      }*/



    /* if(recentlySura.isEmpty){
                            setState(() {
                              recentlySura.add(SuraModel(
                                  suraNameEn: suraList[index2].suraNameEn,
                                  suraNameAr: suraList[index2].suraNameAr,
                                  suraNumber: suraList[index2].suraNumber,
                                  versesNumber: suraList[index2].versesNumber));
                            });
                          }else if (recentlySura.isNotEmpty) {

                            for(int i=0;i<=recentlySura.length;i++){
                              for(int j=i+1;j<recentlySura.length-1;j++){
                                if(recentlySura[i].suraNumber==recentlySura[j].suraNumber){

                                  return;
                                } else {
                                  setState(() {
                                    recentlySura.insert(
                                        0,
                                       */ /*  SuraDataClass(suraNameEn: englishQuranSuras[index],
                             suraNameAr:arabicQuranSuras[index],
                             versesNumber: AyaNumber[index],

                         ));*/ /*
                                        SuraModel(
                                            suraNameEn: suraList[index2].suraNameEn,
                                            suraNameAr: suraList[index2].suraNameAr,
                                            suraNumber: suraList[index2].suraNumber,
                                            versesNumber:
                                            suraList[index2].versesNumber));
                                  });
                                }
                              }
                            }

                          }*/

  }
  void search(String suraName) {
    searchSura = [];
    ///a lower case to match search value
    /*for (int i = 0; i < suraList.length; i++) {
      if (suraList[i].suraNameAr.contains(suraName) ||
          suraList[i].suraNameEn.toLowerCase().contains(suraName)) {
        searchSura.add(suraList[i]);


      }
    }*/
   searchSura= suraList.where((element)=> element.suraNameAr.contains(suraName.toLowerCase())//bug with search
       ||element.suraNameEn.contains(suraName.toLowerCase()) ).toList();///where is making a loop on a list and return itrable of true elements cause that we assign it to search sura tohe make the return to list
  }
}
