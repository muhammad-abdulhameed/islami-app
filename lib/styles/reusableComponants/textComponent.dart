import 'package:flutter/material.dart';
import 'package:islami/styles/colorManeger.dart';
import 'package:islami/styles/stringsManger.dart';

class TextComponent extends StatelessWidget {
   TextComponent({required this.text});
String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,fontFamily: StringManger.fontJanna,color: ColorsManger.tertiary),);
  }
}
