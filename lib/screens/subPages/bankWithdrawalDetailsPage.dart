import 'dart:math';

import 'package:chopwell_rider_application/models/response_models/map_based_response_model.dart';
import 'package:chopwell_rider_application/screens/Nav_Pages/profilePage.dart';
import 'package:chopwell_rider_application/screens/bottom_sheets/pinInputCard.dart';
import 'package:chopwell_rider_application/services/fetch_user_detail_service.dart';
import 'package:chopwell_rider_application/services/wallet_balance_service.dart';
import 'package:flutter/material.dart';
import 'package:chopwell_rider_application/constants/constants.dart';
import 'package:chopwell_rider_application/screens/subPages/changePaymentDetailsPage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:shimmer/shimmer.dart';

final walletBalanceFutureProvider =
    FutureProvider.autoDispose<MapDataResponseModel>((ref) async {
  final walletBalanceService = ref.watch(walletBalanceProvider);
  return walletBalanceService.fetchBalance();
});

class BankWithdrawalDetailsPage extends ConsumerStatefulWidget {
  const BankWithdrawalDetailsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<BankWithdrawalDetailsPage> createState() =>
      _BankWithdrawalDetailsPageState();
}

class _BankWithdrawalDetailsPageState
    extends ConsumerState<BankWithdrawalDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final walletRef = ref.watch(walletBalanceFutureProvider);
    final userDetailRef = ref.watch(fetchUserDetailFutureProvider);

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
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 25,
              ),
            ),
            actions: [
              const IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 25,
                  ))
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.01,
              horizontal: screenWidth * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Wallet Balance',
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            walletRef.when(data: (data) {
                              var formattedBalance = "";
                              var client = "";
                              if (data.status == "error") {
                                formattedBalance = "-- -- ";
                              } else {
                                final balance =
                                    double.parse(data.data["accountBalance"]);
                                formattedBalance = balance.toStringAsFixed(max(
                                    0,
                                    balance.truncateToDouble() == balance
                                        ? 0
                                        : 2));
                                client = data.data["client"];
                              }
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "₦$formattedBalance",
                                    style: TextStyle(
                                      fontFamily: "Questrial",
                                      fontSize: 22,
                                      color: KConstants.baseGreenColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width: screenWidth * .75,
                                    child: Expanded(
                                      child: Text(
                                        client,
                                        style: const TextStyle(
                                          fontFamily: "Questrial",
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              );
                            }, error: (error, _) {
                              return Text(
                                "unable to fetch wallet",
                                style: TextStyle(
                                  fontFamily: "Questrial",
                                  fontSize: 15,
                                  color: KConstants.baseDarkColor,
                                ),
                              );
                            }, loading: () {
                              return Shimmer.fromColors(
                                baseColor: KConstants.baseFourGreyColor,
                                highlightColor: KConstants.baseFourGreyColor,
                                child: Container(
                                  width: screenWidth * .4,
                                  height: 20,
                                  color: Colors.white,
                                ),
                              );
                            }),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'VFD MicroFinance Bank',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: KConstants.baseGreyColor,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'bal',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15,
                            color: KConstants.baseTwoDarkColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1.0,
                      color: Colors.grey.shade900,
                      height: 40,
                    ),
                    const Text(
                      'Bank Payment Details',
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    userDetailRef.when(data: (data) {
                      bool detailsExist = false;
                      Map<String, dynamic> bankDetails = {};
                      if (data.data.containsKey("bank_details") &&
                          data.data["bank_details"] != null) {
                        bankDetails = data.data["bank_details"];

                        setState(() {
                          detailsExist = true;
                        });
                      } else {
                        setState(() {
                          detailsExist = false;
                        });
                      }

                      return detailsExist
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  bankDetails["bank_name"],
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 18.0,
                                    color: KConstants.baseGreyColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  bankDetails["account_name"],
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 18.0,
                                    color: KConstants.baseDarkColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  bankDetails["account_number"],
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 18.0,
                                    color: KConstants.baseDarkColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                              ],
                            )
                          : Text(
                              "Set Withdrawal Account",
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 18.0,
                                color: KConstants.baseRedColor,
                              ),
                            );
                    }, error: (error, _) {
                      return Text(error.toString());
                    }, loading: () {
                      return Shimmer.fromColors(
                        baseColor: KConstants.baseFourGreyColor,
                        highlightColor: KConstants.baseFourGreyColor,
                        child: Container(
                          width: screenWidth,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      );
                    }),
                    userDetailRef.when(data: (data) {
                      final accountNumber =
                          data.data["meta"]["transaction_pin"];
                      print(data.data);
                      return Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return StatefulBuilder(
                                  builder: (BuildContext context,
                                      StateSetter setState) {
                                    return PinInputSheet(
                                      createPin:
                                          accountNumber == null ? true : false,
                                      amount: "",
                                      walletPay: false,
                                      orderId: "",
                                    );
                                  },
                                );
                              },
                            );
                          },
                          child: Text(
                            accountNumber == null
                                ? "create transaction pin"
                                : "change transaction pin",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 15.0,
                              color: KConstants.baseThreeDarkColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }, error: (error, _) {
                      return Container();
                    }, loading: () {
                      return Container();
                    }),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.transparent),
                            elevation: MaterialStatePropertyAll(0.0),
                            padding: MaterialStatePropertyAll(
                                EdgeInsets.only(top: 0.0))),
                        onPressed: () {
                          pushNewScreen(
                            context,
                            screen: ChangePaymentDetailsPage(),
                            withNavBar:
                                false, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        },
                        child: Text(
                          "update bank details",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 15.0,
                            color: KConstants.baseThreeDarkColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Center(
                    child: SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return StatefulBuilder(
                                builder: (BuildContext context,
                                    StateSetter setState) {
                                  return PinInputSheet(
                                    createPin: false,
                                    amount: "",
                                    walletPay: true,
                                    orderId: "",
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: const Text(
                          'Withdraw',
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
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          )),
    );
  }
}
