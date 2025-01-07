import 'package:flutter/material.dart';
import 'package:islami/styles/assetsManger.dart';
import 'package:islami/styles/colorManeger.dart';

class HadithTap extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(

      child: Scaffold(
body: Container(
  decoration: BoxDecoration(
      gradient: LinearGradient(
          colors: [
            ColorsManger.secondary.withOpacity(0.7),
            ColorsManger.secondary,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
      ),
      image: DecorationImage(image: AssetImage(ImagesManger.hadithBackground),fit: BoxFit.fill,)
  ),
),
      ),
    );
  }
}