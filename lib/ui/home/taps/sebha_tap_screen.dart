import 'package:flutter/material.dart';
import 'package:islami/styles/assetsManger.dart';

class SebhaTap extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(ImagesManger.sebhaBackground),fit: BoxFit.fill)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
      ),
    );
  }
}