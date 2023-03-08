import 'package:chopwell_rider_application/constants/constants.dart';
import 'package:chopwell_rider_application/models/request_models/verify_email_request_model.dart';
import 'package:chopwell_rider_application/screens/micro_components/signin_input.dart';
import 'package:chopwell_rider_application/screens/registration_page/loginPage.dart';
import 'package:chopwell_rider_application/screens/registration_page/verifyOtpPage.dart';
import 'package:chopwell_rider_application/services/password_reset_email_service.dart';
import 'package:flutter/material.dart';

class ConfirmEmailPage extends StatefulWidget {
  const ConfirmEmailPage({Key? key}) : super(key: key);

  @override
  State<ConfirmEmailPage> createState() => _ConfirmEmailPageState();
}

class _ConfirmEmailPageState extends State<ConfirmEmailPage> {
  final TextEditingController _emailController = TextEditingController();

  bool _showProgressIndicator = false;

  void _handleEmailConfirmation() async {
    final email = _emailController.text;
    _showProgressIndicator = true;
    final request = VerifyEmailRequestModel(email: email);

    final response = await PasswordResetEmailService.passwordReset(request);
    print(response);
    if (response.status == "success") {
      _showProgressIndicator = false;
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return VerifyOtpPage(email: email);
      }));
    } else {
      print(response);
      ScaffoldMessenger.of(context)
          .showSnackBar(customErrorBar("Unable to confirm email"));
    }
    // Do something with the email and password values
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return MaterialApp(
        home: SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          child: ListView(
            children: [
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  height: height * .3,
                  width: width * .2,
                  decoration: BoxDecoration(
                    color: KConstants.baseRedColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: width * .8,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * .05),
                        child: SignInput(
                          Icons.email_rounded,
                          "enter your registered email",
                          "user@gmail.com",
                          controller: _emailController,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
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
                                onPressed: () => _handleEmailConfirmation(),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
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
            ],
          ),
        ),
      ),
    ));
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 3, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 30);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
