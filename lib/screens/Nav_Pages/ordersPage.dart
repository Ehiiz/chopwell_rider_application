import 'package:chopwell_rider_application/constants/constants.dart';
import 'package:chopwell_rider_application/providers/cart_provider.dart';
import 'package:chopwell_rider_application/screens/micro_components/order_favourites.dart';
import 'package:chopwell_rider_application/screens/micro_components/previous_orders_box.dart';
import 'package:chopwell_rider_application/services/fetch_orders_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import '../../models/response_models/list_based_response_model.dart';

final riderOrderFutureProvider =
    FutureProvider.autoDispose<ListDataResponseModel>((ref) async {
  final orderSummaryDetails = ref.watch(fetchOrdersProvider);
  return orderSummaryDetails.orders();
});

class MyOrders extends ConsumerWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final riderOrdersRef = ref.watch(riderOrderFutureProvider);
    final cart = ref.watch(cartStateNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          Container(
            width: screenWidth,
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Orders',
                    style: TextStyle(
                      fontFamily: "Questrial",
                      fontSize: 30.0,
                      color: KConstants.baseDarkColor,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    "assets/notification-svgrepo-com.svg",
                    color: KConstants.baseTwoDarkColor,
                    width: 35.0,
                    height: 35.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.01, horizontal: screenWidth * 0.02),
          child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: KConstants.baseFourGreyColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TabBar(
                        labelPadding: EdgeInsets.symmetric(vertical: 5),
                        indicator: BoxDecoration(
                            color: KConstants.baseDarkColor,
                            borderRadius: BorderRadius.circular(10)),
                        labelStyle: TextStyle(
                          color: KConstants.baseDarkColor,
                          fontFamily: "Montserrat",
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                        labelColor: Colors.white, // set label text color
                        unselectedLabelColor: KConstants
                            .baseTwoGreyColor, // set unselected label text color
                        indicatorColor:
                            KConstants.baseDarkColor, // set indicator color
                        indicatorWeight: 3,
                        tabs: [
                          Text(
                            "ongoing",
                          ),
                          Text(
                            "completed",
                          ),
                        ]),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                      child: TabBarView(children: [
                    riderOrdersRef.when(
                      data: (data) {
                        final orderList = data.data;
                        final List<Map<String, dynamic>> completedOrders = [];

                        orderList.forEach((element) {
                          if (element["status"] != "completed") {
                            completedOrders.add(element);
                          }
                        });

                        return completedOrders.isNotEmpty
                            ? RefreshIndicator(
                                child: ListView.builder(
                                  physics: const ClampingScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: completedOrders.length,
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          OrderFavouritesBox(
                                    false,
                                    false,
                                    completedOrders[index]["order_details"]
                                        ["food"],
                                    completedOrders[index]["created_at"],
                                    completedOrders[index]["amount"].toString(),
                                    completedOrders[index]["_id"],
                                    completedOrders[index]["restaurant"]
                                        ["name"],
                                    completedOrders[index]["total"],
                                    completedOrders[index]["deliveryFee"],
                                    completedOrders[index]["vat"],
                                    "",
                                    completedOrders[index]["status"],
                                    completedOrders[index]["preOrder"]
                                        ["status"],
                                    completedOrders[index]["preOrder"]
                                        ["deliveryTime"],
                                  ),
                                ),
                                onRefresh: () async {
                                  ref.refresh(riderOrderFutureProvider);
                                })
                            : Center(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: screenHeight * .2,
                                      ),
                                      SvgPicture.asset(
                                        "assets/Burger.svg",
                                        width: 100,
                                        height: 100,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text("No completed orders... yettt",
                                          style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ]),
                              );
                      },
                      error: (error, _) {
                        return Text(error.toString());
                      },
                      loading: () {
                        return SizedBox(
                          width: 400,
                          child: ListView.builder(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: 3,
                            itemBuilder: (BuildContext context, int index) =>
                                Shimmer.fromColors(
                              baseColor: KConstants.baseFourGreyColor,
                              highlightColor: KConstants.baseFourDarkColor,
                              child: Container(
                                  height: 200,
                                  width: 150,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20.0),
                                    ),
                                  )),
                            ),
                          ),
                        );
                      },
                    ),
                    riderOrdersRef.when(
                      data: (data) {
                        final orderList = data.data;
                        final List<Map<String, dynamic>> completedOrders = [];

                        orderList.forEach((element) {
                          if (element["status"] == "completed") {
                            completedOrders.add(element);
                          }
                        });

                        return completedOrders.isEmpty
                            ? Center(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: screenHeight * .2,
                                      ),
                                      SvgPicture.asset(
                                        "assets/Burger.svg",
                                        width: 100,
                                        height: 100,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text("No completed orders... yettt",
                                          style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ]),
                              )
                            : RefreshIndicator(
                                child: ListView.builder(
                                  physics: const ClampingScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: completedOrders.length,
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          PreviousOrderBox(
                                    completedOrders[index]["created_at"]
                                        .toString(),
                                    completedOrders[index]["amount"].toString(),
                                    completedOrders[index]["restaurant"]["name"]
                                        .toString(),
                                    completedOrders[index]["_id"],
                                  ),
                                ),
                                onRefresh: () async {
                                  ref.refresh(riderOrderFutureProvider);
                                });
                      },
                      error: (error, _) {
                        return Text(error.toString());
                      },
                      loading: () {
                        return SizedBox(
                          width: 400,
                          child: ListView.builder(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: 3,
                            itemBuilder: (BuildContext context, int index) =>
                                Shimmer.fromColors(
                              baseColor: KConstants.baseFourGreyColor,
                              highlightColor: KConstants.baseFourDarkColor,
                              child: Container(
                                  height: 200,
                                  width: 150,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20.0),
                                    ),
                                  )),
                            ),
                          ),
                        );
                      },
                    ),
                  ]))
                ],
              ))),
    );
  }
}
