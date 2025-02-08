import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/styles/assetsManger.dart';
import 'package:islami/styles/colorManeger.dart';
import 'package:islami/ui/hadith%20details%20screen/screen/hadithDetails_screen.dart';
import 'package:islami/ui/home/widgets/hadithClass.dart';
import 'package:islami/ui/home/widgets/hadithWidget.dart';

class HadithTap extends StatefulWidget {

  @override
  State<HadithTap> createState() => _HadithTapState();
}

class _HadithTapState extends State<HadithTap> {
  PageController pageController=PageController(viewportFraction: 0.8);
  String hadith="";
late int hadithIndex;
  late String title="";
  late String content="";
  List <String>hadithNum=[];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadFiles();

  }

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
  child: SafeArea(
    child: Column(
      children: [
        Image.asset(ImagesManger.appLogo,),
Expanded(
  child:  PageView.builder(itemBuilder: (context, index) {
    hadithIndex=index;
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(HadithDetails.routeName,arguments: HadithClass(hadithNum:hadithModel[index].hadithNum ,
            hadithContent: hadithModel[index].hadithContent));
      },
        child: HadithWidget(hadithClass: hadithModel[index],));

    },
    onPageChanged: (value) => setState(() {
loadFiles();
    }),
    controller: pageController,

  itemCount: 50,

  ),
)
      ],
    ),
  ),
),
      ),
    );
  }
List<HadithClass>hadithModel=[];

  loadFiles()async{
    hadith=await rootBundle.loadString("assets/files/ahadeth.txt");

List<String> tempHadith=hadith.split("#");/// here split hadith text on # to split every hadith individual

for(int i =0;i<tempHadith.length;i++){
  hadithNum=tempHadith[i].trim().split("\n");///here we split hadith num and save it in list ????????????
  title=hadithNum[0].trim();
  hadithNum.removeAt(0);
  content=hadithNum.join("");
  hadithModel.add(HadithClass(hadithNum: title, hadithContent: content));



}

    setState(() {

    });
  }
}