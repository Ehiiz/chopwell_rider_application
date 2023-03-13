// ignore_for_file: unrelated_type_equality_checks, no_leading_underscores_for_local_identifiers, prefer_const_constructors

import 'package:chopwell_rider_application/main.dart';
import 'package:chopwell_rider_application/models/request_models/withdraw_wallet_request_model.dart';
import 'package:chopwell_rider_application/screens/micro_components/signin_input.dart';
import 'package:chopwell_rider_application/screens/registration_page/loginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:pinput/pinput.dart';

import '../../constants/constants.dart';
import '../../models/request_models/change_pin_request_model.dart';
import '../../models/request_models/create_pin_request_model.dart';
import '../../services/pay_wallet_service.dart';
import '../../services/transaction_pin_service.dart';

final pinInfo = StateProvider<String>((ref) => "");

class PinInputSheet extends ConsumerStatefulWidget {
  PinInputSheet({
    Key? key,
    required this.createPin,
    required this.amount,
    required this.walletPay,
    required this.orderId,
  }) : super(key: key);

  final bool createPin;
  final String amount;
  final bool walletPay;
  final String orderId;

  @override
  ConsumerState<PinInputSheet> createState() =>
      _PinInputSheetState(createPin, amount, walletPay, orderId);
}

class _PinInputSheetState extends ConsumerState<PinInputSheet> {
  TextEditingController _firstpinController = TextEditingController();
  TextEditingController _secondpinController = TextEditingController();
  TextEditingController _amountController = TextEditingController();

  bool _showProgressIndicator = false;

  bool _showSecondInput = false;

  String new_pin = "";
  String old_pin = "";

  _PinInputSheetState(bool this.createPin, String this.amount,
      bool this.walletPay, String this.orderId);

  final bool createPin;
  final String amount;
  final bool walletPay;
  final String orderId;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    void _createTransactionPin(String pin) async {
      setState(() {
        _showProgressIndicator = true;
      });
      final request = CreatePinRequestModel(pin: pin);
      final response = await PinService.createNewPin(request);

      if (response.status == "success") {
        setState(() {
          _showProgressIndicator = false;
        });
        Navigator.pop(context);
        ScaffoldMessenger.of(context)
            .showSnackBar(customSuccessBar("Pin Successfully Created"));
        //create pop up that pin has been created successfully
      } else {
        Navigator.pop(context);
        ScaffoldMessenger.of(context)
            .showSnackBar(customErrorBar("Error creating pin"));
        // create pop up that pin failed or pass in error
      }
    }

    void _changeTransactionPin(String new_pin, String old_pin) async {
      setState(() {
        _showProgressIndicator = true;
      });
      final request = ChangePinRequestModel(old_pin: old_pin, new_pin: new_pin);
      final response = await PinService.changePin(request);

      if (response.status == "success") {
        setState(() {
          _showProgressIndicator = false;
        });
        Navigator.pop(context);

        ScaffoldMessenger.of(context).showSnackBar(
          customSuccessBar("Pin Changed Successfully"),
        );
        //create pop up that pin has been updated successfully
      } else {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          customErrorBar("Error changing pin"),
        );

        // create pop up that pin failed or pass in error
      }
    }

    void _withdrawWallet(String amount, String pin) async {
      setState(() {
        _showProgressIndicator = true;
      });
      final request = WithdrawWalletRequestModel(pin: pin, amount: amount);
      final response = await PayWalletService.paywallet(request);

      if (response.status == "success") {
        setState(() {
          _showProgressIndicator = false;
        });
        print(response);
        Navigator.pop(context);
        ScaffoldMessenger.of(context)
            .showSnackBar(customSuccessBar("Successfully paid with wallet"));

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return BottomNavBar();
        }));
        //create pop up that pin has been updated successfully
      } else {
        // create pop up that pin failed or pass in error
        Navigator.pop(context);
        ScaffoldMessenger.of(context)
            .showSnackBar(customSuccessBar("Error paying with wallet"));
      }
    }

    void _enterNewModal() {
      _firstpinController.clear();
      setState(() {
        _showSecondInput = true;
      });
    }

    return Material(
      color: Colors.transparent,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        width: screenWidth,
        height: screenHeight,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            walletPay
                ? SignInput(Icons.money, "enter amount", "",
                    controller: _amountController)
                : Container(),
            Text(
              walletPay
                  ? ""
                  : createPin
                      ? "enter pin"
                      : _showSecondInput
                          ? "enter new pin"
                          : "enter old pin",
              style: TextStyle(
                fontFamily: "Questrial",
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: KConstants.baseTwoDarkColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            _showSecondInput
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * .1),
                    child: SizedBox(
                      child: PinCodeTextField(
                          appContext: context,
                          keyboardType: TextInputType.number,
                          length: 4,
                          obscuringCharacter: '●',
                          useHapticFeedback: true,
                          controller: _secondpinController,
                          onChanged: (value) {
                            if (value.length == 4) {
                              old_pin = value;
                            }
                          }),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * .1),
                    child: SizedBox(
                      child: PinCodeTextField(
                          appContext: context,
                          keyboardType: TextInputType.number,
                          length: 4,
                          obscuringCharacter: '●',
                          useHapticFeedback: true,
                          controller: _firstpinController,
                          onChanged: (value) {
                            if (value.length == 4) {
                              new_pin = value;
                            }
                          }),
                    ),
                  ),
            const SizedBox(height: 20),
            // NumberPad(),
            Stack(
              children: [
                SizedBox(
                  width: 200,
                  height: 45,
                  child: OutlinedButton(
                    onPressed: () {
                      walletPay
                          ? _withdrawWallet(
                              _amountController.text,
                              new_pin,
                            )
                          : createPin
                              ? _createTransactionPin(
                                  new_pin,
                                )
                              : _showSecondInput
                                  ? _changeTransactionPin(
                                      old_pin,
                                      new_pin,
                                    )
                                  : _enterNewModal();
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(KConstants.baseDarkColor),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      )),
                    ),
                    child: Text(
                      _showProgressIndicator
                          ? ""
                          : walletPay
                              ? "withdraw"
                              : createPin
                                  ? "set pin"
                                  : _showSecondInput
                                      ? 'Submit'
                                      : "Next",
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
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
      ),
    );
  }
}

// Widget buildPinPut() {
//   return Pinput(
//     onCompleted: (pin) => print(pin),
//   );
// }
