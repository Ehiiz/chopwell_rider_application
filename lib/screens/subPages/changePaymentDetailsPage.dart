// ignore_for_file: prefer_const_constructors

import 'package:chopwell_rider_application/builders/subAppBar.dart';
import 'package:chopwell_rider_application/models/request_models/name_enquiry_request_model.dart';
import 'package:chopwell_rider_application/models/request_models/update_bank_details_request_model.dart';
import 'package:chopwell_rider_application/models/response_models/map_based_response_model.dart';
import 'package:chopwell_rider_application/screens/micro_components/signin_input.dart';
import 'package:chopwell_rider_application/constants/constants.dart';
import 'package:chopwell_rider_application/screens/registration_page/loginPage.dart';
import 'package:chopwell_rider_application/services/fetch_bank_list_service.dart';
import 'package:chopwell_rider_application/services/update_bank_details_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Nav_Pages/profilePage.dart';

final bankListServiceFutureProvider =
    FutureProvider<MapDataResponseModel>((ref) {
  final bankList = ref.watch(bankListServiceProvider);
  return bankList.bankList();
});

class ChangePaymentDetailsPage extends ConsumerStatefulWidget {
  const ChangePaymentDetailsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ChangePaymentDetailsPage> createState() =>
      _ChangePaymentDetailsPageState();
}

class _ChangePaymentDetailsPageState
    extends ConsumerState<ChangePaymentDetailsPage> {
  TextEditingController _bankNameController = TextEditingController();
  TextEditingController _accountNumberController = TextEditingController();
  TextEditingController _accountNameController = TextEditingController();

  Future<MapDataResponseModel> _fetchBankList() async {
    final response = await BankEnquiryService().bankList();

    if (response.status == "success") {
      return response;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        customErrorBar("Unable to fetch banks"),
      );
      throw Exception("Unable to fetch banks");
    }
  }

  Future<MapDataResponseModel> _verifyUserName(
      BuildContext context, String account_number, String bank_code) async {
    setState(() {
      _verifyingName = true;
    });
    final request = NameEnquiryRequestModel(
        account_number: account_number, bank_code: bank_code);
    final response = await BankEnquiryService().nameEnquiry(request);

    if (response.status == "success") {
      setState(() {
        _verifyingName = true;
      });
      return response;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        customErrorBar("Unable to verify account"),
      );
      throw Exception("Unable to verify account");
    }
  }

  String _selectedItem = "9 Payment Service Bank";
  String _userName = "";
  String bankCode = "";
  List<dynamic> bankCodeList = [];
  bool _verifyingName = false;
  bool _showProgressIndicator = false;
  bool _buttonReady = false;

  void _updateBankDetails(BuildContext context, String account_number,
      String account_name, String bank_name, String bank_code) async {
    setState(() {
      _showProgressIndicator = true;
    });
    final request = UpdateBankDetailsRequestModel(
      account_number: account_number,
      account_name: account_name,
      bank_name: bank_name,
      bank_code: bank_code,
    );

    final response = await UpdateBankDetailsService().updateBank(request);

    if (response.status == "success") {
      setState(() {
        _showProgressIndicator = false;
      });
      ref.refresh(fetchUserDetailFutureProvider);
      ScaffoldMessenger.of(context).showSnackBar(
        customSuccessBar("Bank details updated"),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        customErrorBar("Failed to update bank details"),
      );
      throw Error();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final bankList = ref.watch(bankListServiceFutureProvider);

    return SafeArea(
      child: Scaffold(
          appBar: buildAppBar(context),
          body: Padding(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.01,
                horizontal: screenWidth * 0.02,
              ),
              child: SingleChildScrollView(
                  child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Update Payment Details',
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 35,
                              width: screenWidth,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: KConstants.baseRedColor,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: DropdownButton(
                                value: _selectedItem,
                                items: defaultBankList
                                    .map<DropdownMenuItem<String>>(
                                        (Map<String, dynamic> value) {
                                  return DropdownMenuItem<String>(
                                    value: value["name"]! as String,
                                    child: SizedBox(
                                      width: screenWidth * .8,
                                      child: Text(
                                        value["name"]!,
                                        maxLines: 1,
                                        overflow: TextOverflow.fade,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "Montserrat",
                                          color: KConstants.baseTwoRedColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  final result = defaultBankList.firstWhere(
                                      (item) => item['name'] == value);
                                  setState(() {
                                    _selectedItem = value as String;
                                    bankCode = result["code"];
                                  });
                                },
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "bank name",
                            style: TextStyle(
                              fontFamily: "Questrial",
                              color: KConstants.baseRedColor,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 35,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: KConstants.baseRedColor,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            child: TextField(
                              controller: _accountNumberController,
                              keyboardType: TextInputType.number,
                              onChanged: (value) async {
                                if (value.length > 10) {
                                  _accountNumberController.text =
                                      _accountNumberController.text
                                          .substring(0, 10);
                                }
                                if (value.length == 10) {
                                  setState(() {
                                    _verifyingName = true;
                                  });
                                  final response = await _verifyUserName(
                                      context,
                                      _accountNumberController.text,
                                      bankCode);
                                  setState(() {
                                    _accountNameController.text =
                                        response.data["name"];
                                    _verifyingName = false;
                                    _buttonReady = true;
                                  });
                                }
                              },
                              maxLines: 1,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                labelText: "000000",
                                labelStyle: TextStyle(
                                  color: KConstants.baseTwoGreyColor,
                                  fontSize: 15,
                                  height: 1,
                                  fontFamily: "Montserrat",
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "account number",
                            style: TextStyle(
                              fontFamily: "Questrial",
                              color: KConstants.baseRedColor,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 35,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: KConstants.baseRedColor,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            child: TextField(
                              controller: _accountNameController,
                              maxLines: 1,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                labelText: "oriasotie emmanuel",
                                labelStyle: TextStyle(
                                  color: KConstants.baseTwoGreyColor,
                                  fontSize: 15,
                                  height: 1,
                                  fontFamily: "Montserrat",
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "account name",
                            style: TextStyle(
                              fontFamily: "Questrial",
                              color: KConstants.baseRedColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Center(
                          child: Stack(
                        children: [
                          SizedBox(
                            width: 300,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                _updateBankDetails(
                                  context,
                                  _accountNumberController.text,
                                  _accountNameController.text,
                                  _selectedItem,
                                  bankCode,
                                );
                              },
                              // ignore: sort_child_properties_last
                              child: Text(
                                _showProgressIndicator
                                    ? ""
                                    : 'Update Bank Details',
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    _buttonReady
                                        ? KConstants.baseTwoRedColor
                                        : KConstants.baseGreyColor,
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  )),
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
                      )),
                    ],
                  ),
                  if (_verifyingName)
                    Positioned.fill(
                      child: Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.transparent,
                          color: KConstants.baseRedColor,
                        ),
                      ),
                    ),
                ],
              )))),
    );
  }
}
