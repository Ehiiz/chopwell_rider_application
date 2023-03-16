import 'package:chopwell_rider_application/constants/constants.dart';
import 'package:chopwell_rider_application/screens/Nav_Pages/homePage.dart';
import 'package:chopwell_rider_application/screens/Nav_Pages/ordersPage.dart';
import 'package:chopwell_rider_application/screens/Nav_Pages/profilePage.dart';
import 'package:chopwell_rider_application/screens/registration_page/loginPage.dart';
import 'package:chopwell_rider_application/screens/registration_page/signUpPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));

  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  OneSignal.shared.setAppId("ae02ca85-5f1a-40d7-95ef-794f6db70a28");
  OneSignal.shared
      .promptUserForPushNotificationPermission()
      .then((accepted) => print("Accepted Permission: $accepted"));
  OneSignal.shared.getDeviceState().then((value) => {print(value!.userId)});
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: "Montserrat",
            primaryTextTheme: TextTheme(
              titleLarge: TextStyle(
                fontFamily: "Questrial",
                fontSize: 30.0,
                color: KConstants.baseDarkColor,
              ),
              titleMedium: TextStyle(
                color: KConstants.baseDarkColor,
                fontFamily: "Montserrat",
                fontSize: 25.0,
              ),
            ),
            textTheme: TextTheme(
              bodySmall: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                color: KConstants.baseThreeDarkColor,
              ),
            ),
            buttonTheme: ButtonThemeData(
              buttonColor: KConstants.baseTwoRedColor,
              padding:
                  const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
              disabledColor: KConstants.baseThreeDarkColor,
              splashColor: KConstants.baseFourRedColor,
            )),
        home: BottomNavBar());
  }
}

class BottomNavBar extends StatelessWidget {
  BottomNavBar({Key? key}) : super(key: key);

  List<Widget> _buildScreens() {
    return [
      const MyHomePage(),
      const MyOrders(),
      const NewProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.house),
        title: "Home",
        textStyle: const TextStyle(
          fontFamily: "Questrial",
        ),
        activeColorPrimary: KConstants.baseRedColor,
        inactiveColorPrimary: KConstants.baseFourDarkColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.square_stack_3d_up),
        title: "Orders",
        textStyle: const TextStyle(fontFamily: "Questrial"),
        activeColorPrimary: KConstants.baseRedColor,
        inactiveColorPrimary: KConstants.baseFourDarkColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.profile_circled),
        title: "Profile",
        // ignore: prefer_const_constructors
        textStyle: TextStyle(fontFamily: "Questrial"),
        activeColorPrimary: KConstants.baseRedColor,
        inactiveColorPrimary: KConstants.baseFourDarkColor,
      ),
    ];
  }

  int currentIndex = 0;

  // ignore: prefer_final_fields
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.elasticIn,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style1, // Choose the nav bar style with this property.
    );
    ;
  }
}
