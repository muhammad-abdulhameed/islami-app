import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/styles/assetsManger.dart';
import 'package:islami/styles/colorManeger.dart';
import 'package:islami/styles/reusableComponants/textComponent.dart';
import 'package:islami/styles/stringsManger.dart';
import 'package:islami/ui/home/taps/hadith_tap_screen.dart';
import 'package:islami/ui/home/taps/quran_tap_screen.dart';
import 'package:islami/ui/home/taps/radio_tap_screen.dart';
import 'package:islami/ui/home/taps/sebha_tap_screen.dart';
import 'package:islami/ui/home/taps/time_tap_screen.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> navBarWidget =[
    QuranTap(),
    HadithTap(),
    SebhaTap(),
    RadioTap(),
    TimeTap()
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
resizeToAvoidBottomInset: false,
      bottomNavigationBar: NavigationBar(
        backgroundColor: ColorsManger.primary,
        selectedIndex: selectedIndex,
        indicatorColor: ColorsManger.secondary.withOpacity(0.6),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,

        onDestinationSelected:(index) => setState(() {
          selectedIndex=index;
        }) ,

        destinations: [
          NavigationDestination(icon:SvgPicture.asset(ImagesManger.quranNavbarLogo) ,
              label: StringManger.quran,

            selectedIcon: SvgPicture.asset(ImagesManger.quranNavbarLogo,
              colorFilter:ColorFilter.mode(ColorsManger.tertiary, BlendMode.srcIn),),

          ),
          NavigationDestination(icon:SvgPicture.asset(ImagesManger.hadithNavbarLogo) ,
              label: StringManger.hadith,
            selectedIcon: SvgPicture.asset(ImagesManger.hadithNavbarLogo,
              colorFilter:ColorFilter.mode(ColorsManger.tertiary, BlendMode.srcIn),),
          ),
          NavigationDestination(icon:SvgPicture.asset(ImagesManger.sebhaNavbarLogo) ,
              label: StringManger.sebha,
              selectedIcon: SvgPicture.asset(ImagesManger.sebhaNavbarLogo,
                colorFilter:ColorFilter.mode(ColorsManger.tertiary, BlendMode.srcIn), ),
          ),
          NavigationDestination(icon:SvgPicture.asset(ImagesManger.radioNavbarLogo) ,
              label: StringManger.radio,
            selectedIcon: SvgPicture.asset(ImagesManger.radioNavbarLogo,
              colorFilter:ColorFilter.mode(ColorsManger.tertiary, BlendMode.srcIn),),
          ),
          NavigationDestination(icon:SvgPicture.asset(ImagesManger.timeNavbarLogo) ,
              label: StringManger.time,
            selectedIcon: SvgPicture.asset(ImagesManger.timeNavbarLogo,
              colorFilter:ColorFilter.mode(ColorsManger.tertiary, BlendMode.srcIn),),
          ),

        ],
      ),
      body: navBarWidget[selectedIndex],
    );
  }
}
