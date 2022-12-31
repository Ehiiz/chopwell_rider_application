import 'package:chopwell_merchant_application/Nav_Pages/mainPage.dart';
import 'package:chopwell_merchant_application/components/add_food.dart';
import 'package:chopwell_merchant_application/components/order_progress_bar.dart';
import 'package:chopwell_merchant_application/components/product_list.dart';
import 'package:chopwell_merchant_application/components/restaurant_box.dart';
import 'package:chopwell_merchant_application/Nav_Pages/ordersPage.dart';
import 'package:flutter/material.dart';
import 'package:chopwell_merchant_application/constants/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:chopwell_merchant_application/registration_page/signUpPage.dart';
import 'package:chopwell_merchant_application/Nav_Pages/homePage.dart';
import 'package:chopwell_merchant_application/Nav_Pages/searchPage.dart';
import 'package:chopwell_merchant_application/Nav_Pages/ordersPage.dart';
import 'package:chopwell_merchant_application/components/signin_input.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  var height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: ListView(
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                height: height * .5,
                width: width,
                decoration: BoxDecoration(
                  color: KConstants.baseRedColor,
                ),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Image(
                        image: AssetImage(
                          'images/chopwell mascot enjoyment.png',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Text(
                          'Enjoy Great Meals At Your Door Steps',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontFamily: "Questrial",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    children: [
                      SignInput(
                          Icons.person_2_rounded, "full name", "jane doe"),
                      SizedBox(
                        height: 15,
                      ),
                      SignInput(Icons.email_rounded, "email", "jamie@123.com"),
                      SizedBox(
                        height: 15,
                      ),
                      SignInput(Icons.location_city_rounded, "address",
                          "no 122, benin city"),
                      SizedBox(
                        height: 15,
                      ),
                      SignInput(
                          Icons.password_rounded, "password", "Password123"),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'forgot password',
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: width * 0.6,
                        height: 45,
                        child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return MainNavPage();
                              }));
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  KConstants.baseDarkColor,
                                ),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ))),
                            child: Text(
                              'sign in',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'or',
                        style: TextStyle(
                          fontFamily: "Montserrat",
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              print('you\'ve been pressed');
                            },
                            icon: SvgPicture.asset(
                              "assets/Google.svg",
                              width: 50,
                              height: 50,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          IconButton(
                            onPressed: () {
                              print('you\'ve been pressed');
                            },
                            icon: SvgPicture.asset(
                              "assets/apple-icon.svg",
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Registration();
                          }));
                        },
                        child: Text(
                          'don\'t have an account? create one ',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Montserrat",
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 30);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
