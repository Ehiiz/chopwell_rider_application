import 'package:chopwell_rider_application/constants/constants.dart';
import 'package:chopwell_rider_application/models/request_models/verify_otp_request_model.dart';
import 'package:chopwell_rider_application/screens/micro_components/signin_input.dart';
import 'package:chopwell_rider_application/screens/registration_page/completeAccountPage.dart';
import 'package:chopwell_rider_application/screens/registration_page/loginPage.dart';
import 'package:chopwell_rider_application/screens/registration_page/resetPasswordPage.dart';
import 'package:chopwell_rider_application/services/verify_otp_service.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class ResetOtpPage extends StatefulWidget {
  ResetOtpPage({Key? key, required this.phoneNumber}) : super(key: key);

  String phoneNumber;

  @override
  State<ResetOtpPage> createState() => _ResetOtpPageState(this.phoneNumber);
}

class _ResetOtpPageState extends State<ResetOtpPage> {
  final TextEditingController _otpController = TextEditingController();

  _ResetOtpPageState(this.phoneNumber);

  bool _showProgressIndicator = false;

  String phoneNumber;
  bool _isButtonDisabled = true;

  @override
  void initState() {
    super.initState();
    _otpController.addListener(_validateInput);
  }

  void _handleVerifyOTP(BuildContext context) async {
    final otp = _otpController.text;
    _showProgressIndicator = true;

    final request = VerifyOtpRequestModel(phoneNumber: phoneNumber, otp: otp);
    final response = await VerifyOtpService.verifyotp(request);

    if (response.status == "success") {
      //Add toast notfication
      _showProgressIndicator = false;
      ScaffoldMessenger.of(context).showSnackBar(
          customSuccessBar("OTP Verification Successful, Sign In"));

      pushNewScreen(
        context,
        screen: ResetPasswordPage(phoneNumber: phoneNumber, otp: otp),
        withNavBar: false, // OPTIONAL VALUE. True by default.
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
      ;
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(customErrorBar("OTP Verification Failed"));
    }
    // Do something with the email and password values
  }

  void _validateInput() {
    final otpValid = otpRegex.hasMatch(_otpController.text);
    setState(() {
      _isButtonDisabled = !(otpValid);
    });
  }

  @override
  void dispose() {
    _otpController.dispose();
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
                          Icons.numbers_outlined,
                          "otp",
                          "invalid otp",
                          "",
                          true,
                          regExp: otpRegex,
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
                                onPressed: _isButtonDisabled
                                    ? null
                                    : () => _handleVerifyOTP(context),
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
