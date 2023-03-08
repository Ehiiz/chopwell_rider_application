import 'package:chopwell_rider_application/screens/Nav_Pages/homePage.dart';
import 'package:chopwell_rider_application/screens/Nav_Pages/ordersPage.dart';
import 'package:chopwell_rider_application/screens/Nav_Pages/profilePage.dart';
import 'package:flutter/material.dart';
import "package:chopwell_rider_application/constants/constants.dart";
import 'package:flutter_svg/flutter_svg.dart';

class MainNavPage extends StatefulWidget {
  const MainNavPage({Key? key}) : super(key: key);

  @override
  State<MainNavPage> createState() => _MainNavPageState();
}

class _MainNavPageState extends State<MainNavPage> {
  List pages = [
    HomePage(),
    MyOrders(),
    NewProfilePage(),
  ];
  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            onTap: onTap,
            currentIndex: currentIndex,
            unselectedFontSize: 0,
            selectedFontSize: 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: KConstants.baseRedColor,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            selectedIconTheme: IconThemeData(
              color: KConstants.baseTwoRedColor,
            ),
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/Home.svg",
                  color: currentIndex == 0
                      ? KConstants.baseRedColor
                      : Color(0xFFAFB4BB),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/bi_bookmark-check-fill.svg",
                  color: currentIndex == 1
                      ? KConstants.baseRedColor
                      : Color(0xFFAFB4BB),
                ),
                label: 'Wallet',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/Profile.svg",
                  color: currentIndex == 2
                      ? KConstants.baseRedColor
                      : Color(0xFFAFB4BB),
                ),
                label: 'Profile',
              ),
            ]));
  }
}
