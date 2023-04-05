import 'package:chopwell_rider_application/constants/constants.dart';
import 'package:chopwell_rider_application/screens/registration_page/loginPage.dart';
import 'package:chopwell_rider_application/services/set_new_password_service.dart';
import 'package:flutter/material.dart';

import '../../models/request_models/set_new_password_request_model.dart';
import '../micro_components/signin_input.dart';

class ResetPasswordPage extends StatefulWidget {
  ResetPasswordPage({Key? key, required this.email, required this.otp})
      : super(key: key);

  String email;
  String otp;
  @override
  State<ResetPasswordPage> createState() =>
      _ResetPasswordPageState(this.email, this.otp);
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController _newPasswordController = TextEditingController();
  _ResetPasswordPageState(this.email, this.otp);
  String email;
  String otp;

  bool _showProgressIndicator = false;
  bool _isButtonDisabled = true;

  @override
  void initState() {
    super.initState();
    _newPasswordController.addListener(_validateInput);
  }

  void _handleSetPassword() async {
    _showProgressIndicator = true;
    final new_password = _newPasswordController.text;

    final request = SetNewPasswordRequestModel(
        email: email, otp: otp, new_password: new_password);
    final response = await SetNewPasswordService.setNewPassword(request);

    if (response.status == "success") {
      //Add toast notfication
      _showProgressIndicator = false;
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LoginPage();
      }));
    } else {
      print(response);
      ScaffoldMessenger.of(context)
          .showSnackBar(customErrorBar("Unable to reset password"));
    }
    // Do something with the email and password values
  }

  void _validateInput() {
    final passwordValid = passwordRegex.hasMatch(_newPasswordController.text);
    setState(() {
      _isButtonDisabled = !(passwordValid);
    });
  }

  @override
  void dispose() {
    _newPasswordController.dispose();
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
              Container(
                width: width * .8,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * .05),
                        child: SignInput(
                          Icons.email_outlined,
                          "email",
                          "incorrect email",
                          "user@gmail.com",
                          true,
                          regExp: passwordRegex,
                          controller: _newPasswordController,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Stack(
                        children: [
                          SizedBox(
                            width: 200,
                            height: 48,
                            child: OutlinedButton(
                                onPressed: () => _handleSetPassword(),
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
