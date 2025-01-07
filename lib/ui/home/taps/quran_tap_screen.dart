import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/styles/assetsManger.dart';
import 'package:islami/styles/colorManeger.dart';
import 'package:islami/styles/reusableComponants/textComponent.dart';
import 'package:islami/styles/stringsManger.dart';
import 'package:islami/ui/home/service/sura-obj-List.dart';
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

  List<SuraModel> recentlySura = [];

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
              TextComponent(text: StringManger.surasList),
              Expanded(
                flex: 2,
                child: ListView.separated(
                  itemCount: arabicQuranSuras.length,
                  itemBuilder: (context, index2) => ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed(SuraDetails.routeName,arguments: SuraModel(suraNameEn: suraList[index2].suraNameEn,
                          suraNameAr: suraList[index2].suraNameAr,
                          versesNumber: suraList[index2].versesNumber,
                          suraNumber: index2+1));
                      Timer(Duration(seconds: 2), () {
                        if (recentlySura.isEmpty) {
                          setState(() {
                            recentlySura.add(SuraModel(
                                suraNameEn: suraList[index2].suraNameEn,
                                suraNameAr: suraList[index2].suraNameAr,
                                suraNumber: suraList[index2].suraNumber,
                                versesNumber: suraList[index2].versesNumber));
                          });
                        } else if (!recentlySura.any((element) =>
                        element ==
                            SuraModel(
                                suraNameEn: suraList[index2].suraNameEn,
                                suraNameAr: suraList[index2].suraNameAr,
                                suraNumber: suraList[index2].suraNumber,
                                versesNumber: suraList[index2].versesNumber))) {
                          print(index2);
                          setState(() {
                            recentlySura.insert(
                                0,
                                SuraModel(
                                    suraNameEn: suraList[index2].suraNameEn,
                                    suraNameAr: suraList[index2].suraNameAr,
                                    suraNumber: suraList[index2].suraNumber,
                                    versesNumber: suraList[index2].versesNumber));
                          });
                        }
                      });
                      

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
                    },
                    leading: Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset(ImagesManger.ayaNumLogo),
                        TextComponent(
                          text: "  ${suraList[index2].suraNumber} ",
                        )
                      ],
                    ),
                    title: TextComponent(text: suraList[index2].suraNameEn),
                    subtitle: Text(
                      "Verses ${suraList[index2].versesNumber}",
                      style: TextStyle(
                          fontFamily: StringManger.fontJanna,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: ColorsManger.tertiary),
                    ),
                    trailing: TextComponent(text: suraList[index2].suraNameAr),
                  ),
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
}
