import 'package:flutter/material.dart';
import 'package:islami/styles/reusableComponants/shared_pref.dart';
import 'package:islami/ui/hadith%20details%20screen/screen/hadithDetails_screen.dart';
import 'package:islami/ui/home/screen/home_screen.dart';
import 'package:islami/ui/onBordingScreen/onbordingScreen.dart';
import 'package:islami/ui/splach/screen/splach_screen.dart';
import 'package:islami/ui/sura_details_screen/screen/sura_details.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
await PrefHelper.init();
  runApp(const MyApp());
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName:(_)=>SplashScreen(),
        HomeScreen.routeName:(_)=>HomeScreen(),
        SuraDetails.routeName:(_)=>SuraDetails(),
        HadithDetails.routeName:(_)=>HadithDetails(),
        OnBoardingScreen.routeName:(_)=>OnBoardingScreen(),

      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
