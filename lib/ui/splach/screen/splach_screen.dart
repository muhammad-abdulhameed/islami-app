

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami/styles/assetsManger.dart';
import 'package:islami/ui/home/screen/home_screen.dart';

class SplashScreen extends StatefulWidget{
  static String routeName="SplashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {//create function on intiState case build may called many times and call time many times (creat timer every time)
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext){
    return Scaffold(
      body: Container(
        child: Image.asset(ImagesManger.splashScreen,fit: BoxFit.fill,width: double.infinity),
       /* decoration: BoxDecoration(
          image:DecorationImage(image:AssetImage(ImagesManger.splashScreen),fit: BoxFit.fill) ,
        ),*/

      ),
    );
  }
}