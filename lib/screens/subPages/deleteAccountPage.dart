import 'package:chopwell_rider_application/authentication/token-utils.dart';
import 'package:chopwell_rider_application/builders/subAppBar.dart';
import 'package:chopwell_rider_application/constants/constants.dart';
import 'package:chopwell_rider_application/screens/micro_components/signin_input.dart';
import 'package:chopwell_rider_application/screens/registration_page/loginPage.dart';
import 'package:chopwell_rider_application/services/signin_service.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class DeleteAccountPage extends StatefulWidget {
  const DeleteAccountPage({Key? key}) : super(key: key);

  @override
  State<DeleteAccountPage> createState() => _DeleteAccountPageState();
}

class _DeleteAccountPageState extends State<DeleteAccountPage> {
  final TextEditingController _phoneController = TextEditingController();
  bool _showProgressIndicator = false;
  bool _isButtonDisabled = true;

  void _validateInput() {
    final phoneValid = phoneRegex.hasMatch(_phoneController.text);
    setState(() {
      _isButtonDisabled = !phoneValid;
    });
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "According to our privacy policy, once you delete your account and associated data, this action cannot be reversed. To proceed with the account deletion, please verify your intention by providing the phone number linked to your account.",
            style: TextStyle(
                fontFamily: "Montserrat", fontSize: 14.0, color: Colors.black),
          ),
          const SizedBox(
            height: 10,
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
          Stack(
            children: [
              SizedBox(
                width: 200,
                height: 48,
                child: OutlinedButton(
                    onPressed: _isButtonDisabled
                        ? null
                        : () async {
                            setState(() {
                              _showProgressIndicator = true;
                            });
                            final response = await SigninService.deleteAccount(
                                {"phoneNumber": _phoneController.text});
                            if (response.status == "success") {
                              setState(() {
                                _showProgressIndicator = true;
                              });
                              await AuthToken.clearAuthToken();
                              // ignore: use_build_context_synchronously
                              pushNewScreen(
                                context,
                                screen: LoginPage(),
                                withNavBar:
                                    false, // OPTIONAL VALUE. True by default.
                                pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                              );
                            } else {
                              setState(() {
                                _showProgressIndicator = false;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                  customErrorBar("Error Deleting Account"));
                            }
                          },
                    style: ButtonStyle(
                      backgroundColor: _isButtonDisabled
                          ? MaterialStateProperty.all(
                              KConstants.baseThreeGreyColor)
                          : MaterialStateProperty.all(KConstants.baseDarkColor),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      )),
                    ),
                    child: Text(
                      _showProgressIndicator ? '' : "Delete Account",
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
        ],
      ),
    ));
  }
}
