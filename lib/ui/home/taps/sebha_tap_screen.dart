import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/styles/assetsManger.dart';
import 'package:islami/styles/colorManeger.dart';
import 'package:islami/styles/stringsManger.dart';

class SebhaTap extends StatefulWidget {
  @override
  State<SebhaTap> createState() => _SebhaTapState();
}

class _SebhaTapState extends State<SebhaTap> {
  List<String> taspehList = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
    "لا حول ولا قوه الا بالله"
  ];
  int count = 0;
  double angel = 0;

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImagesManger.sebhaBackground),
              fit: BoxFit.fill)),
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Image.asset(
                  ImagesManger.appLogo,
                ),

                Container(
                  child: GestureDetector(
                    onTap: () {
                      changeAngel();
                      StringManger.tasbehCount += 1;
                      setState(() {
                        if (StringManger.tasbehCount == 33) {
                          count += 1;
                          StringManger.tasbehCount = 0;
                          if (count == taspehList.length) {
                            count = 0;
                          }
                          /*for(int i=0;i<taspehList.length;i++){
                      StringManger.subhanAllah=taspehList[i];
                      StringManger.tasbehCount=0;
                      StringManger.subhanAllah=taspehList[i];

                    }*/
                        }
                      });
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(margin: EdgeInsets.only(bottom: height*.50,left: width*.07),
                          child: Image.asset(
                            ImagesManger.headOfSebha,
                            height: 80,
                            width: 70,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                        Transform.rotate(
                          angle: angel,
                          child: SvgPicture.asset(

                            ImagesManger.sebhaBody,

                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              taspehList[count],
                              style: TextStyle(
                                fontSize: 36,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              StringManger.tasbehCount.toString(),
                              style: TextStyle(
                                fontSize: 36,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  changeAngel() {
    angel += -10;
  }
}
