
import 'package:flutter/material.dart';
import 'package:islami/styles/assetsManger.dart';
import 'package:islami/styles/colorManeger.dart';
import 'package:islami/styles/stringsManger.dart';
import 'package:islami/ui/onBordingScreen/dataClass/onBoardingdataClass.dart';

class OnBoardingWidget extends StatelessWidget {
  OnBoardingWidget({required this.onBoardingDataClass});

  OnBoardingDataClass onBoardingDataClass;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(flex: 2,
          child: Image.asset(onBoardingDataClass.image)),
      Text(onBoardingDataClass.firstText,textAlign: TextAlign.center,style: TextStyle(color: ColorsManger.primary,fontFamily: StringManger.fontJanna,fontWeight: FontWeight.w700,fontSize: 24,),),
      Text(onBoardingDataClass.secondText,textAlign: TextAlign.center,style: TextStyle(color: ColorsManger.primary,fontFamily: StringManger.fontJanna,fontWeight: FontWeight.w700,fontSize: 24),),
    ],);
  }
}
