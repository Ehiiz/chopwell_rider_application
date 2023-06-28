import 'package:chopwell_rider_application/authentication/token-utils.dart';
import 'package:chopwell_rider_application/authentication/user-utils.dart';
import 'package:chopwell_rider_application/constants/constants.dart';
import 'package:chopwell_rider_application/main.dart';
import 'package:chopwell_rider_application/models/request_models/signin_request_model.dart';
import 'package:chopwell_rider_application/screens/micro_components/signin_input.dart';
import 'package:chopwell_rider_application/screens/registration_page/completeAccountPage.dart';
import 'package:chopwell_rider_application/screens/registration_page/confirmEmailPage.dart';
import 'package:chopwell_rider_application/screens/registration_page/signUpPage.dart';
import 'package:chopwell_rider_application/services/signin_service.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _showProgressIndicator = false;
  bool _isButtonDisabled = true;

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(_validateInput);
    _passwordController.addListener(_validateInput);
  }

  void _handleSignIn(BuildContext context) async {
    setState(() {
      _showProgressIndicator = true;
    });

    final appId = await OneSignal.shared.getDeviceState().then((value) {
      print(value!.userId);
      final appId = value!.userId;
      return appId;
    });

    final phone = _phoneController.text;
    final password = _passwordController.text;
    final request = SignInRequestModel(
        phoneNumber: phone, password: password, appId: appId!);
    final response = await SigninService.signin(request);

    if (response.status == "success") {
      // ignore: use_build_context_synchronously

      if (response.data["status"]) {
        // ignore: use_build_context_synchronously

        setState(() {
          _showProgressIndicator = false;
        });

        final user = response.data["rider"];

        await UserInfo.setUserInfo(user!);
        await AuthToken.setAuthToken(response.data["token"]);

        pushNewScreen(
          context,
          screen: BottomNavBar(),
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      } else {
        pushNewScreen(
          context,
          screen: CompleteAccountPage(phoneNumber: phone),
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      }
    } else {
      setState(() {
        _showProgressIndicator = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(customErrorBar("Login failed"));

      //pop up error
    }
    // Do something with the email and password values
  }

  void _validateInput() {
    final phoneValid = phoneRegex.hasMatch(_phoneController.text);
    final passwordValid = passwordRegex.hasMatch(_passwordController.text);
    setState(() {
      _isButtonDisabled = !(phoneValid && passwordValid);
    });
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return WillPopScope(
        child: SafeArea(
          child: Scaffold(
            body: SizedBox(
              height: height,
              width: width,
              child: ListView(
                scrollDirection: Axis.vertical,
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
                            const SizedBox(
                              height: 20,
                            ),
                            const Image(
                              image: AssetImage(
                                'images/chopwell mascot enjoyment.png',
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: const Text(
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
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * .05),
                    child: SignInput(
                      Icons.phone,
                      "phone",
                      "incorrect phone number",
                      "080",
                      true,
                      regExp: phoneRegex,
                      controller: _phoneController,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * .05),
                    child: SignInput(
                      Icons.password_rounded,
                      "password",
                      "invalid password",
                      "input your password",
                      true,
                      regExp: passwordRegex,
                      controller: _passwordController,
                    ),
                  ),
                  Container(
                    width: width * .8,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * .05,
                            ),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: TextButton(
                                  onPressed: () {
                                    pushNewScreen(
                                      context,
                                      screen: ConfirmEmailPage(),
                                      withNavBar:
                                          false, // OPTIONAL VALUE. True by default.
                                      pageTransitionAnimation:
                                          PageTransitionAnimation.cupertino,
                                    );
                                    ;
                                  },
                                  child: Text("forgot password",
                                      style: TextStyle(
                                          fontFamily: "Questrial",
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          color: KConstants.baseDarkColor))),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Stack(
                            children: [
                              SizedBox(
                                width: 200,
                                height: 48,
                                child: OutlinedButton(
                                    onPressed: _isButtonDisabled
                                        ? null
                                        : () async {
                                            _handleSignIn(context);
                                          },
                                    style: ButtonStyle(
                                      backgroundColor: _isButtonDisabled
                                          ? MaterialStateProperty.all(
                                              KConstants.baseThreeGreyColor)
                                          : MaterialStateProperty.all(
                                              KConstants.baseDarkColor),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      )),
                                    ),
                                    child: Text(
                                      _showProgressIndicator ? '' : "sign in",
                                      // ignore: prefer_const_constructors
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                              ),
                              if (_showProgressIndicator)
                                const Positioned.fill(
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ]),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      child: GestureDetector(
                        onTap: () {
                          pushNewScreen(
                            context,
                            screen: SignUpPage(),
                            withNavBar:
                                false, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                          ;
                        },
                        child: Text(
                          //backgroundColor: MaterialStateProperty.all(KConstants.baseRedColor),
                          'don\'t have an account? Sign up',
                          style: TextStyle(
                              color: KConstants.baseTwoDarkColor,
                              fontSize: 20,
                              fontFamily: "Questrial",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
        onWillPop: () async {
          // Disable back button press
          return false;
        });
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

SnackBar customErrorBar(String message) {
  return SnackBar(
    content: Text(
      message,
      style: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: KConstants.baseRedColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
    ),
  );
}

SnackBar customSuccessBar(String message) {
  return SnackBar(
    content: Text(
      message,
      style: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: KConstants.baseGreenColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
    ),
  );
}
