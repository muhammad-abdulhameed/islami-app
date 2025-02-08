import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/styles/assetsManger.dart';
import 'package:islami/styles/colorManeger.dart';
import 'package:islami/styles/reusableComponants/textComponent.dart';
import 'package:islami/styles/stringsManger.dart';
import 'package:islami/ui/home/widgets/hadithClass.dart';

class HadithWidget extends StatelessWidget {
  HadithWidget({super.key, required this.hadithClass});

  HadithClass hadithClass;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: ColorsManger.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Image.asset(
                  ImagesManger.leftCorner,
                  color: ColorsManger.secondary,
                ),
                Expanded(
                    child: Text(
                  hadithClass.hadithNum,
                  style: TextStyle(
                      color: ColorsManger.secondary,
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      fontFamily: StringManger.fontJanna),
                  textAlign: TextAlign.center,
                )),
                Image.asset(
                  ImagesManger.rightCorner,
                  color: ColorsManger.secondary,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Stack(
                      children: [
                        Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              ImagesManger.hadithCardBack,
                              color: ColorsManger.secondary,
                            )),
                        Text(
                          hadithClass.hadithContent,
                          style: TextStyle(
                              color: ColorsManger.secondary,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              fontFamily: StringManger.fontJanna),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                  ),
                ),
                Image.asset(
                  ImagesManger.bottomImageMosque,
                  color: ColorsManger.secondary,
                  fit: BoxFit.fill,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
