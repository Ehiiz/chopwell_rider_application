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

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _showProgressIndicator = false;
  bool _isButtonDisabled = true;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateInput);
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

    final email = _emailController.text;
    final password = _passwordController.text;
    final request =
        SignInRequestModel(email: email, password: password, appId: appId!);
    final response = await SigninService.signin(request);

    if (response.status == "success") {
      // ignore: use_build_context_synchronously

      if (response.data["status"]) {
        // ignore: use_build_context_synchronously

        setState(() {
          _showProgressIndicator = false;
        });
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return BottomNavBar();
        }));
      } else {
        // ignore: use_build_context_synchronously
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CompleteAccountPage();
        }));
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
    final emailValid = emailRegExp.hasMatch(_emailController.text);
    final passwordValid = passwordRegex.hasMatch(_passwordController.text);
    setState(() {
      _isButtonDisabled = !(emailValid && passwordValid);
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
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
                  Icons.email_outlined,
                  "email",
                  "incorrect email",
                  "user@gmail.com",
                  true,
                  regExp: emailRegExp,
                  controller: _emailController,
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
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return ConfirmEmailPage();
                                }));
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
                                    : () => _handleSignIn(context),
                                style: ButtonStyle(
                                  backgroundColor: _isButtonDisabled
                                      ? MaterialStateProperty.all(
                                          KConstants.baseThreeGreyColor)
                                      : MaterialStateProperty.all(
                                          KConstants.baseDarkColor),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SignUpPage();
                      }));
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
