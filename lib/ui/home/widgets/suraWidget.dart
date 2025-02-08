import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami/ui/home/widgets/suraclass.dart';

import '../../../styles/assetsManger.dart';
import '../../../styles/colorManeger.dart';
import '../../../styles/reusableComponants/textComponent.dart';
import '../../../styles/stringsManger.dart';
import '../../sura_details_screen/screen/sura_details.dart';
typedef onSuraTap= Function(SuraModel);
class SuraWidget extends StatelessWidget {
   SuraWidget({super.key,required this.suraModel,required this.onSuraTap});
SuraModel suraModel;
Function onSuraTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onSuraTap(suraModel);
      },
      leading: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(ImagesManger.ayaNumLogo),
          TextComponent(
            text: "  ${suraModel.suraNumber} ",
          )
        ],
      ),
      title: TextComponent(text: suraModel.suraNameEn),
      subtitle: Text(
        "Verses ${suraModel.versesNumber}",
        style: TextStyle(
            fontFamily: StringManger.fontJanna,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: ColorsManger.tertiary),
      ),
      trailing: TextComponent(text:  suraModel.suraNameAr),
    ) ;
  }
}
