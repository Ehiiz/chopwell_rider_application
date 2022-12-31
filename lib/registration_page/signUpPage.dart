import 'package:chopwell_merchant_application/components/restaurant_box.dart';
import 'package:chopwell_merchant_application/Nav_Pages/homePage.dart';
import 'package:chopwell_merchant_application/Nav_Pages/searchPage.dart';
import 'package:flutter/material.dart';
import 'package:chopwell_merchant_application/constants/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:chopwell_merchant_application/registration_page/loginPage.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                      ),
                      labelText: "Enter Your Email",
                      hintText: 'user@mail.com',
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                      ),
                      labelText: "Enter Your Email",
                      hintText: 'user@mail.com',
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                      ),
                      labelText: "Enter Your Email",
                      hintText: 'user@mail.com',
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                      ),
                      labelText: "Enter Your Email",
                      hintText: 'user@mail.com',
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 200,
                  height: 45,
                  child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return HomePage();
                        }));
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(KConstants.baseRedColor),
                      ),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )),
                ),
                SizedBox(
                  height: 80,
                ),
                SizedBox(
                  width: 300,
                  height: 45,
                  child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return HomePage();
                        }));
                      },
                      style: ButtonStyle(
                        //backgroundColor: MaterialStateProperty.all(KConstants.baseRedColor),
                        side: MaterialStateProperty.all(
                          BorderSide(color: KConstants.baseRedColor),
                        ),
                      ),
                      child: Text(
                        'Already a User? Login',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
