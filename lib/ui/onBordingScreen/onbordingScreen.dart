import 'package:flutter/material.dart';
import 'package:islami/styles/colorManeger.dart';
import 'package:islami/styles/reusableComponants/shared_pref.dart';
import 'package:islami/styles/stringsManger.dart';
import 'package:islami/ui/home/screen/home_screen.dart';
import 'package:islami/ui/onBordingScreen/widgets/onBoardingWidget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../styles/assetsManger.dart';
import 'dataClass/onBoardingdataClass.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = "OnBoardingScreen";

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<OnBoardingDataClass> dataClass = [
    OnBoardingDataClass(image: ImagesManger.introWelcome, firstText: StringManger.welcomeToIslmiApp, secondText: ""),
    OnBoardingDataClass(image: ImagesManger.introMosque, firstText: StringManger.firstIntroTitle, secondText: StringManger.firstIntroDesc),
    OnBoardingDataClass(image: ImagesManger.introQuran, firstText: StringManger.secondIntroTitle, secondText: StringManger.secondIntroDesc),
    OnBoardingDataClass(image: ImagesManger.introBearish, firstText: StringManger.threeIntroTitle, secondText: StringManger.threeIntroDesc),
    OnBoardingDataClass(image: ImagesManger.introRadio, firstText: StringManger.forceIntroTitle, secondText: StringManger.forceIntroDesc),
  ];
  late PageController pageController;
  int currentPage=0;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
     pageController=PageController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.secondary,
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              ImagesManger.appLogo,
            ),
            Expanded(child: PageView.builder(
              onPageChanged: (value){
                setState(() {
                  currentPage=value;
                });

              },
              controller:pageController ,
              itemCount: dataClass.length,
              itemBuilder:(context, index) => OnBoardingWidget(onBoardingDataClass: dataClass[index],),))

            ,Row(
              children: [
                if(currentPage!=0)
                TextButton(onPressed: (){
                  pageController.previousPage(duration: Duration(milliseconds: 200),curve: Curves.bounceIn );
                },
                    child: Text("Back",
                      style: TextStyle(color: ColorsManger.primary,fontSize: 16,fontFamily: StringManger.fontJanna,fontWeight: FontWeight.w400),)),
                Expanded(
                  child: Align(alignment: Alignment
                    .center,
                    child: AnimatedSmoothIndicator(

                          // PageController
                        count:  dataClass.length,
                        effect:  ExpandingDotsEffect(activeDotColor: ColorsManger.primary,dotHeight: 7,dotWidth: 7,spacing: 11,strokeWidth: 20),  // your preferred effect
                        onDotClicked: (index){
                        }, activeIndex:currentPage
                    ),
                  ),
                ),
                TextButton(onPressed: (){
                  if(currentPage==dataClass.length-1){
                    Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
                    PrefHelper.setBool(false);
                  }
                  pageController.nextPage(duration: Duration(milliseconds: 200), curve: Curves.bounceIn);
                },
                    child: Text(currentPage==dataClass.length-1?StringManger.finish:StringManger.next,
                        style: TextStyle(color: ColorsManger.primary,fontSize: 16,fontFamily: StringManger.fontJanna,fontWeight: FontWeight.w400))),
              ],)
          ],
        ),
      ),
    );
  }
}
