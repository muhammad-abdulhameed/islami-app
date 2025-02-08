import 'package:flutter/material.dart';
import 'package:islami/ui/home/widgets/hadithClass.dart';

import '../../../styles/assetsManger.dart';
import '../../../styles/colorManeger.dart';
import '../../../styles/stringsManger.dart';

class HadithDetails extends StatelessWidget {
  static String routeName="HadithDetails";


  @override
  Widget build(BuildContext context) {
  HadithClass hadithClass=  ModalRoute.of(context)?.settings.arguments as HadithClass;
    return Scaffold(
      backgroundColor: ColorsManger.secondary,
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorsManger.primary),
        backgroundColor: Colors.transparent,
        title: Text(hadithClass.hadithNum,
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
                     hadithClass.hadithNum,
                      style: TextStyle(color: ColorsManger.primary, fontSize: 20),
                      textAlign: TextAlign.center,
                    )),
                Image.asset(ImagesManger.rightCorner),
              ],
            ),
            Expanded(//Expanded cause scsv need available space to work
              child: SingleChildScrollView(//make it scrollable to make  (Row) fixed while scrolling

                child: Text(hadithClass.hadithContent
                  ,
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
    );;
  }
}
