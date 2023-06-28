import 'package:chopwell_rider_application/constants/constants.dart';
import 'package:chopwell_rider_application/models/request_models/signup_request_model.dart';
import 'package:chopwell_rider_application/screens/micro_components/signin_input.dart';
import 'package:chopwell_rider_application/screens/registration_page/completeAccountPage.dart';
import 'package:chopwell_rider_application/screens/registration_page/loginPage.dart';
import 'package:chopwell_rider_application/screens/registration_page/verifyOtpPage.dart';
import 'package:chopwell_rider_application/services/signup_service.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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

  void _handleSignUp(BuildContext context) async {
    final phone = _phoneController.text;
    final password = _passwordController.text;

    setState(() {
      _showProgressIndicator = true;
    });
    final request = SignupRequestModel(phoneNumber: phone, password: password);
    final response = await SignupService.signup(request);

    if (response.status == "success") {
      setState(() {
        _showProgressIndicator = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(customSuccessBar("Signup Successful. Log in"));
      pushNewScreen(
        context,
        screen: VerifyOtpPage(phoneNumber: phone),
        withNavBar: false, // OPTIONAL VALUE. True by default.
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
      ;
    } else {
      setState(() {
        _showProgressIndicator = false;
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(customErrorBar("Failed to sign up"));
    }
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
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
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
                  "phone number",
                  "invalid phone number",
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
                  "password must have at least one letter, one number and one special character",
                  "create a strong password",
                  true,
                  regExp: passwordRegex,
                  controller: _passwordController,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: width * .8,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: 200,
                            height: 48,
                            child: OutlinedButton(
                                onPressed: _isButtonDisabled
                                    ? null
                                    : () => _handleSignUp(context),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      KConstants.baseDarkColor),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  )),
                                ),
                                child: Text(
                                  _showProgressIndicator ? '' : "sign up",
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
                        screen: LoginPage(),
                        withNavBar: false, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                      ;
                    },
                    child: Text(
                      //backgroundColor: MaterialStateProperty.all(KConstants.baseRedColor),
                      'already a user? Login',
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
