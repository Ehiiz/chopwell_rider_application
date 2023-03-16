import 'package:chopwell_rider_application/constants/constants.dart';
import 'package:chopwell_rider_application/models/request_models/verify_otp_request_model.dart';
import 'package:chopwell_rider_application/screens/micro_components/signin_input.dart';
import 'package:chopwell_rider_application/screens/registration_page/loginPage.dart';
import 'package:chopwell_rider_application/screens/registration_page/resetPasswordPage.dart';
import 'package:chopwell_rider_application/services/verify_otp_service.dart';
import 'package:flutter/material.dart';

class VerifyOtpPage extends StatefulWidget {
  VerifyOtpPage({Key? key, required this.email}) : super(key: key);

  String email;

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState(this.email);
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  final TextEditingController _otpController = TextEditingController();

  _VerifyOtpPageState(this.email);

  bool _showProgressIndicator = false;

  String email;

  void _handleVerifyOTP(BuildContext context) async {
    final otp = _otpController.text;
    _showProgressIndicator = true;

    final request = VerifyOtpRequestModel(email: email, otp: otp);
    final response = await VerifyOtpService.verifyotp(request);

    if (response.status == "success") {
      //Add toast notfication
      _showProgressIndicator = false;
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ResetPasswordPage(email: email, otp: otp);
      }));
    } else {
      print(response);
      ScaffoldMessenger.of(context)
          .showSnackBar(customErrorBar("OTP Verification Failed"));
    }
    // Do something with the email and password values
  }

  @override
  void dispose() {
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
              Container(
                width: width * .8,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * .05),
                        child: SignInput(
                          Icons.email_rounded,
                          "enter your OTP",
                          "",
                          controller: _otpController,
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
                                onPressed: () => _handleVerifyOTP(context),
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
