import 'package:chopwell_rider_application/builders/subAppBar.dart';
import 'package:chopwell_rider_application/services/fetch_delivery_history_service.dart';
import 'package:flutter/material.dart';
import 'package:chopwell_rider_application/constants/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../models/response_models/list_based_response_model.dart';

final fetchDeliveryFutureProvider =
    FutureProvider.autoDispose<ListDataResponseModel>((ref) async {
  final orderHistoryDetails = ref.watch(deliveryHistoryProvider);
  return orderHistoryDetails.history();
});

class OrderHistoryPage extends ConsumerWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final riderDeliveries = ref.watch(fetchDeliveryFutureProvider);

    return Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.01, horizontal: screenWidth * 0.02),
        child: ListView(children: [
          const Text('Delivery History',
              style: TextStyle(
                  color: Colors.black, fontSize: 20, fontFamily: "Montserrat")),
          const SizedBox(height: 10),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       'june',
          //       style: TextStyle(
          //         fontSize: 20,
          //         fontFamily: "Montserrat",
          //         color: KConstants.baseGreyColor,
          //       ),
          //     ),
          //     Text(
          //       "2000",
          //       style: TextStyle(
          //           fontFamily: "Montserrat",
          //           color: KConstants.baseRedColor,
          //           fontWeight: FontWeight.bold,
          //           fontSize: 25.0),
          //     ),
          //   ],
          // ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: riderDeliveries.when(data: (data) {
              final deliveries = data.data;
              return deliveries.isNotEmpty
                  ? List.generate(
                      deliveries.length,
                      (index) => Container(
                            height: 100.0,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    IntrinsicHeight(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 0,
                                            top: 10,
                                            bottom: 10,
                                            right: 10),
                                        child: Image(
                                          image: AssetImage(
                                              //   deliveries[index]["restaurant_image"],
                                              KConstants.foodImages[index]),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            DateFormat("dd MMM yyyy, hh:mm a")
                                                .format(DateTime.parse(
                                                    deliveries[index]
                                                        ["created_at"])),
                                            style: TextStyle(
                                              fontFamily: "Montserrat",
                                              color:
                                                  KConstants.baseThreeDarkColor,
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            deliveries[index]
                                                ["restaurant_name"],
                                            style: TextStyle(
                                              fontFamily: "Montserrat",
                                              color: KConstants.baseRedColor,
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10.0,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                "assets/location.svg",
                                                width: 12,
                                                height: 12,
                                              ),
                                              const SizedBox(
                                                width: 5.0,
                                              ),
                                              Container(
                                                width: screenWidth * .4,
                                                child: Expanded(
                                                  child: Text(
                                                    deliveries[index]
                                                        ["location"]["address"],
                                                    maxLines: 1,
                                                    style: const TextStyle(
                                                      fontSize: 13,
                                                      fontFamily: 'Montserrat',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "₦${deliveries[index]["deliveryFee"]}",
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      color: KConstants.baseDarkColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              ],
                            ),
                          ))
                  : [
                      Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: screenHeight * .2,
                              ),
                              SvgPicture.asset(
                                "assets/Brownie.svg",
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
                    ];
            }, error: (error, _) {
              return [Text("unable to fetch data")];
            }, loading: () {
              return [Text("")];
            }),
          ),
        ]),
      ),
    );
  }
}
