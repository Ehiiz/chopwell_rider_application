import 'package:chopwell_rider_application/constants/constants.dart';
import 'package:chopwell_rider_application/providers/cart_provider.dart';
import 'package:chopwell_rider_application/screens/micro_components/order_favourites.dart';
import 'package:chopwell_rider_application/screens/micro_components/previous_orders_box.dart';
import 'package:chopwell_rider_application/services/fetch_orders_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../models/response_models/null_list_based_response_model.dart';

final customerOrdersFutureProvider =
    FutureProvider.autoDispose<NullListDataResponseModel>((ref) async {
  final customerOrderService = ref.watch(fetchOrdersProvider);
  return customerOrderService.orders();
});

class MyOrders extends ConsumerWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final customerOrderRef = ref.watch(customerOrdersFutureProvider);
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
                      style: Theme.of(context).primaryTextTheme.titleLarge,
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
        body: RefreshIndicator(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.01,
                  horizontal: screenWidth * 0.02),
              child: ListView(children: [
                const SizedBox(height: 10),
                Text(
                  'current order',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Montserrat",
                    color: KConstants.baseTwoDarkColor,
                  ),
                ),
                const SizedBox(height: 15),
                customerOrderRef.when(
                  data: (data) {
                    final orderList = data.data;
                    final List<Map<String, dynamic>> completedOrders = [];

                    orderList.forEach((element) {
                      if (element["status"] != "completed") {
                        completedOrders.add(element);
                      }
                    });

                    print(completedOrders);
                    return ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: completedOrders.length,
                      itemBuilder: (BuildContext context, int index) =>
                          OrderFavouritesBox(
                              false,
                              false,
                              completedOrders[index]["order_details"]["food"],
                              completedOrders[index]["created_at"],
                              completedOrders[index]["amount"].toString(),
                              completedOrders[index]["_id"],
                              completedOrders[index]["restaurant"]["name"],
                              completedOrders[index]["total"],
                              completedOrders[index]["deliveryFee"],
                              completedOrders[index]["vat"],
                              completedOrders[index]["account"]),
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
                              margin: const EdgeInsets.symmetric(vertical: 5.0),
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
                const SizedBox(height: 15),
                Text(
                  'previous orders',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Montserrat",
                    color: KConstants.baseTwoDarkColor,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                customerOrderRef.when(
                  data: (data) {
                    final orderList = data.data;
                    final List<Map<String, dynamic>> completedOrders = [];

                    orderList.forEach((element) {
                      if (element["status"] == "completed") {
                        completedOrders.add(element);
                      }
                    });

                    return completedOrders.isEmpty
                        ? Container()
                        : ListView.builder(
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: completedOrders.length,
                            itemBuilder: (BuildContext context, int index) =>
                                PreviousOrderBox(
                                    completedOrders[index]["created_at"]
                                        .toString(),
                                    completedOrders[index]["amount"].toString(),
                                    completedOrders[index]["restaurant"]["name"]
                                        .toString(),
                                    completedOrders[index]["_id"]),
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
                              margin: const EdgeInsets.symmetric(vertical: 5.0),
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
              ]),
            ),
            onRefresh: () async {
              ref.refresh(customerOrdersFutureProvider);
            }));
  }
}
