import 'package:chopwell_merchant_application/Nav_Pages/mainPage.dart';
import 'package:flutter/material.dart';
import 'package:chopwell_merchant_application/constants/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
              disabledColor: KConstants.baseThreeDarkColor,
              splashColor: KConstants.baseFourRedColor,
            )),
        home: MainNavPage());
  }
}
