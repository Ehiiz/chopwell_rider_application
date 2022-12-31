import 'package:chopwell_merchant_application/Nav_Pages/searchPage.dart';
import 'package:chopwell_merchant_application/Nav_Pages/homePage.dart';
import 'package:chopwell_merchant_application/Nav_Pages/ordersPage.dart';
import 'package:chopwell_merchant_application/Nav_Pages/profilePage.dart';
import 'package:flutter/material.dart';
import "package:chopwell_merchant_application/constants/constants.dart";
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
    ProfilePage(),
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
                icon: SvgPicture.asset("assets/Home.svg"),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/bi_bookmark-check-fill.svg"),
                label: 'Wallet',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/Profile.svg"),
                label: 'Profile',
              ),
            ]));
  }
}
