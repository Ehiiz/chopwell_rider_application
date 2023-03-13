import 'dart:math';

import 'package:chopwell_rider_application/models/response_models/list_based_response_model.dart';
import 'package:chopwell_rider_application/models/response_models/map_based_response_model.dart';
import 'package:chopwell_rider_application/screens/Nav_Pages/ordersPage.dart';
import 'package:chopwell_rider_application/screens/micro_components/order_progress_bar.dart';
import 'package:chopwell_rider_application/screens/subPages/orderProgressPage.dart';
import 'package:chopwell_rider_application/services/home_details_service.dart';
import 'package:flutter/material.dart';
import 'package:chopwell_rider_application/constants/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../services/wallet_balance_service.dart';

final orderSummaryFutureProvider =
    FutureProvider.autoDispose<MapDataResponseModel>((ref) async {
  final orderSummaryDetails = ref.watch(homeDetailsProvider);
  return orderSummaryDetails.summary();
});

final walletBalanceFutureProvider =
    FutureProvider.autoDispose<MapDataResponseModel>(
  (ref) async {
    final walletBalanceDetails = ref.watch(walletBalanceProvider);
    return walletBalanceDetails.fetchBalance();
  },
);

final topProductsFutureProvider =
    FutureProvider.autoDispose<ListDataResponseModel>((ref) async {
  final topProductDetails = ref.watch(homeDetailsProvider);
  return topProductDetails.products();
});

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

int _currentIndex = 0;
final List<Widget> _children = [];

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final orderSummaryRef = ref.watch(orderSummaryFutureProvider);
    final topProductsRef = ref.watch(topProductsFutureProvider);
    final walletBalanceRef = ref.watch(walletBalanceFutureProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.01,
              horizontal: screenWidth * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rider Summary',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'today',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // DropdownMenu(dropdownMenuEntries: [
                    //   DropdownMenuEntry(value: "today", label: "today"),
                    //   DropdownMenuEntry(value: "this week", label: "this week"),
                    // ])
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                walletBalanceRef.when(data: (data) {
                  final balance = double.parse(data.data["accountBalance"]);
                  final formattedBalance = balance.toStringAsFixed(
                      max(0, balance.truncateToDouble() == balance ? 0 : 2));
                  return balanceBox(
                    label: "balance",
                    figure: "₦$formattedBalance",
                    bgColor: KConstants.baseGreenColor,
                    screenWidth: screenWidth,
                    screenHeight: screenHeight * 0.3,
                  );
                }, error: (error, _) {
                  return Text(error.toString());
                }, loading: () {
                  return Shimmer.fromColors(
                    baseColor: KConstants.baseSixGreyColor,
                    highlightColor: KConstants.baseSixGreyColor,
                    child: Container(
                      width: screenWidth,
                      height: screenHeight * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  );
                }),
                const SizedBox(
                  height: 15,
                ),
                orderSummaryRef.when(data: (data) {
                  final orderDetails = data.data;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      balanceBox(
                          bgColor: KConstants.baseOrangeColor,
                          label: "orders",
                          figure: orderDetails["totalOrder"].toString(),
                          screenWidth: screenWidth * 0.45,
                          screenHeight: screenHeight),
                      balanceBox(
                        label: "sales",
                        figure: "₦${orderDetails["orderBalance"].toString()}",
                        bgColor: KConstants.baseTwoRedColor,
                        screenWidth: screenWidth * 0.45,
                        screenHeight: screenHeight,
                      ),
                    ],
                  );
                }, error: (error, _) {
                  return Text(error.toString());
                }, loading: () {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Shimmer.fromColors(
                        baseColor: KConstants.baseFiveGreyColor,
                        highlightColor: KConstants.baseFiveGreyColor,
                        child: Container(
                          width: screenWidth * 0.45,
                          height: screenHeight * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Shimmer.fromColors(
                        baseColor: KConstants.baseFiveGreyColor,
                        highlightColor: KConstants.baseFiveGreyColor,
                        child: Container(
                          width: screenWidth * 0.45,
                          height: screenHeight * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  );
                }),
                const SizedBox(
                  height: 30,
                ),
                // GestureDetector(
                //   onTap: () {
                //     Navigator.push(context,
                //         MaterialPageRoute(builder: (context) {
                //       return MyOrders();
                //     }));
                //   },
                //   child: OrderProgressBar(
                //     KConstants.baseFourGreyColor,
                //     Offset(5, 5),
                //     "assets/Restaurant.svg",
                //     "View Restaurant",
                //     "see your menu",
                //     "view",
                //     KConstants.baseRedColor,
                //     KConstants.baseGreyColor,
                //   ),
                // ),
                const SizedBox(
                  height: 30,
                ),
                // Text(
                //   "Top Sellers",
                //   style: TextStyle(
                //     fontFamily: "Montserrat",
                //     fontSize: 20.0,
                //     color: KConstants.baseTwoGreyColor,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // SizedBox(
                //   height: 15,
                // ),
                //   topProductsRef.when(data: (data) {
                //     print(data.data);
                //     return Container(
                //       height: screenHeight * 0.7,
                //       child: GridView.builder(
                //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //             crossAxisCount: 3,
                //           ),
                //           itemCount: 6,
                //           itemBuilder: (BuildContext context, int index) =>
                //               Container(
                //                 decoration: BoxDecoration(
                //                     borderRadius: BorderRadius.circular(5.0)),
                //                 margin: EdgeInsets.all(5.0),
                //                 child: Image.asset(
                //                     KConstants.restaurantImages[index]),
                //               )),
                //     );
                //   }, error: (error, _) {
                //     return Container(
                //       height: screenHeight * 0.7,
                //       child: GridView.builder(
                //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //             crossAxisCount: 3,
                //           ),
                //           itemCount: 6,
                //           itemBuilder: (BuildContext context, int index) =>
                //               Container(
                //                 decoration: BoxDecoration(
                //                     borderRadius: BorderRadius.circular(5.0)),
                //                 margin: EdgeInsets.all(5.0),
                //                 child: Image.asset(
                //                     KConstants.restaurantImages[index]),
                //               )),
                //     );
                //   }, loading: () {
                //     return Shimmer.fromColors(
                //         child: Container(
                //           color: Colors.white,
                //         ),
                //         baseColor: KConstants.baseThreeGreyColor,
                //         highlightColor: KConstants.baseFiveGreyColor);
                //   })
                //
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class balanceBox extends StatelessWidget {
  const balanceBox({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
    required this.figure,
    required this.label,
    required this.bgColor,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;
  final String figure;
  final String label;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: screenWidth,
        padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 5.0),
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              figure,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  fontFamily: "Montserrat"),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              label,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  fontFamily: "Montserrat"),
            ),
          ],
        ),
      ),
    );
  }
}
