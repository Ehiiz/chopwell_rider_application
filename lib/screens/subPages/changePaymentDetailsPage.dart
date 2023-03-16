// ignore_for_file: prefer_const_constructors

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

  String _selectedItem = "";
  String _userName = "";
  String bankCode = "";
  List<dynamic> bankCodeList = [];
  bool _verifyingName = false;
  bool _showProgressIndicator = false;

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
          appBar: AppBar(
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 25,
              ),
            ),
          ),
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
                        style: Theme.of(context).primaryTextTheme.titleLarge,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 35,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: KConstants.baseRedColor,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            child: bankList.when(data: (data) {
                              bankCodeList =
                                  (data.data["bank"] as List<dynamic>);
                              final bankList =
                                  (data.data["bank"] as List<dynamic>)
                                      .cast<Map<String, dynamic>>();
                              return DropdownButton(
                                value: _selectedItem,
                                items: bankList.map<DropdownMenuItem<String>>(
                                    (Map<String, dynamic> value) {
                                  return DropdownMenuItem<String>(
                                    value: value["name"]! as String,
                                    child: SizedBox(
                                        width: screenWidth * .9,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              value["name"]!,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: "Montserrat",
                                                color:
                                                    KConstants.baseTwoRedColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        )),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  final result = bankCodeList.firstWhere(
                                      (item) => item['name'] == value,
                                      orElse: () => null);
                                  setState(() {
                                    _selectedItem = value as String;
                                    bankCode = result["code"];
                                  });
                                },
                              );
                            }, error: (error, _) {
                              return Text(error.toString());
                            }, loading: () {
                              return Text("Loading");
                            }),
                          ),
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
                                  final response = await _verifyUserName(
                                      context,
                                      _accountNumberController.text,
                                      bankCode);
                                  setState(() {
                                    _accountNameController.text =
                                        response.data["name"];
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
                              child: Text(
                                'Update Bank Details',
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    KConstants.baseTwoRedColor,
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
                    const Positioned.fill(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              )))),
    );
  }
}
