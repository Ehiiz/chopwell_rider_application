import 'package:chopwell_rider_application/constants/constants.dart';
import 'package:chopwell_rider_application/models/request_models/set_delivery_status_request_model.dart';
import 'package:chopwell_rider_application/models/response_models/map_based_response_model.dart';
import 'package:chopwell_rider_application/screens/micro_components/order_favourites.dart';
import 'package:chopwell_rider_application/screens/micro_components/order_progress_bar.dart';
import 'package:chopwell_rider_application/services/single_order_detail_service.dart';
import 'package:chopwell_rider_application/services/update_delivery_status_service.dart';
import 'package:chopwell_rider_application/screens/subPages/singleOrderDetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

final singleProductFutureProvider =
    FutureProvider.autoDispose<MapDataResponseModel>((ref) async {
  final singleProductService = ref.watch(singleOrderProvider);
  final orderId = ref.watch(orderIdProvider);
  return singleProductService.orderDetail(orderId);
});

class ConfirmationPage extends ConsumerWidget {
  ConfirmationPage({Key? key, required this.orderId}) : super(key: key);

  void _confirmDelivery(String orderId, String orderStatus) async {
    final request = SetDeliveryStatusRequestModel(
        order_id: orderId, order_status: orderStatus);

    final response = await UpdateDeliveryStatus.status(request);

    if (response.status == "success") {
      // show pop up and refresh page

      // Navigator.push(context, MaterialPageRoute(builder: (context) {
      //   return MainNavPage();
      // }));
    } else {
      print(response);
    }
  }

  String orderId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final orderDetails = ref.watch(singleProductFutureProvider);
    bool confirmOrder = false;

    List<String> acceptBox = [
      "accepted",
      "completed",
      "ready",
      "delivering",
      "delivered"
    ];

    final List<String> readyBox = [
      "completed",
      "ready",
      "delivering",
      "delivered"
    ];

    final List<String> deliveringBox = ["completed", "delivering", "delivered"];

    final List<String> deliveredBox = ["completed", "delivered"];

    bool orderStatus = false;
    List<dynamic> mealDetails = [];
    String orderId = "";
    String amount = "";
    String date = "";
    String restaurantName = "";
    String total = "";
    String deliveryFee = "";
    String vat = "";
    String account = "";
    String address = "";

    return SafeArea(
      child: SafeArea(
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
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.01,
                horizontal: screenWidth * 0.02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Progress',
                    style: Theme.of(context).primaryTextTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/location.svg"),
                            const SizedBox(
                              width: 5,
                            ),
                            orderDetails.when(data: (data) {
                              print(data.data["location"]["address"]);
                              address = data.data["location"]["address"];
                              return Container(
                                width: screenWidth * .65,
                                child: Expanded(
                                  child: Text(
                                    address,
                                    maxLines: 1,
                                    overflow: TextOverflow.clip,
                                    style: const TextStyle(
                                        fontSize: 15, fontFamily: 'Montserrat'),
                                  ),
                                ),
                              );
                            }, error: (error, _) {
                              return Text(error.toString());
                            }, loading: () {
                              return Shimmer.fromColors(
                                child: Container(width: 10),
                                baseColor: KConstants.baseFourGreyColor,
                                highlightColor: KConstants.baseThreeGreyColor,
                              );
                            }),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SingleOrderDetailsPage(
                              orderStatus: orderStatus,
                              mealDetails: mealDetails,
                              date: date,
                              amount: amount,
                              orderId: orderId,
                              restaurantName: restaurantName,
                              total: total,
                              vat: vat,
                              deliveryFee: deliveryFee,
                              account: account,
                            );
                          }));
                        },
                        child: const Text(
                          "order details",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Questrial',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: orderDetails.when(data: (data) {
                      print(data.data);
                      String status = data.data["status"];

                      bool acceptBoxValue = acceptBox.contains(status);
                      bool readyBoxValue = readyBox.contains(status);
                      bool deliveringBoxValue = deliveringBox.contains(status);
                      bool deliveredBoxValue = deliveredBox.contains(status);
                      if (status == "delivered") {
                        confirmOrder = true;
                      }
                      // orderStatus = status;
                      mealDetails = data.data["order_details"]["food"];
                      date = data.data["created_at"].toString();
                      orderId = data.data["_id"];
                      amount = data.data["amount"].toString();
                      restaurantName =
                          data.data["restaurant"]["name"].toString();
                      deliveryFee = data.data["deliveryFee"];
                      total = data.data["total"];
                      vat = data.data["vat"];
                      account = data.data["account"];

                      return ListView(
                        children: [
                          OrderProgressBar(
                            acceptBoxValue
                                ? KConstants.baseShadowColor
                                : Colors.transparent,
                            const Offset(5, 5),
                            "assets/Restaurant.svg",
                            "Restaurant Accepted",
                            "Your order is being prepared",
                            "done",
                            acceptBoxValue
                                ? KConstants.baseTwoRedColor
                                : KConstants.baseFourGreyColor,
                            acceptBoxValue
                                ? KConstants.baseDarkColor
                                : KConstants.baseFourGreyColor,
                          ),
                          Center(
                            child: Container(
                              height: 7,
                              width: 2,
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: KConstants.baseGreyColor,
                                    width: 1,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          OrderProgressBar(
                            readyBoxValue
                                ? KConstants.baseShadowColor
                                : Colors.transparent,
                            const Offset(5, 5),
                            "assets/Food.svg",
                            "Order Ready",
                            "Your order is ready for pick up",
                            "done",
                            readyBoxValue
                                ? KConstants.baseTwoRedColor
                                : KConstants.baseFourGreyColor,
                            readyBoxValue
                                ? KConstants.baseDarkColor
                                : KConstants.baseFourGreyColor,
                          ),
                          Center(
                            child: Container(
                              height: 7,
                              width: 2,
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: KConstants.baseGreyColor,
                                    width: 1,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          OrderProgressBar(
                            deliveringBoxValue
                                ? KConstants.baseShadowColor
                                : Colors.transparent,
                            const Offset(5, 5),
                            "assets/person-biking-dark-skin-tone-svgrepo-com.svg",
                            "Rider Picked up",
                            "Rider is on his way to you",
                            "done",
                            deliveringBoxValue
                                ? KConstants.baseTwoRedColor
                                : KConstants.baseFourGreyColor,
                            deliveringBoxValue
                                ? KConstants.baseDarkColor
                                : KConstants.baseFourGreyColor,
                          ),
                          Center(
                            child: Container(
                              height: 7,
                              width: 2,
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: KConstants.baseGreyColor,
                                    width: 1,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          OrderProgressBar(
                            deliveredBoxValue
                                ? KConstants.baseFourGreyColor
                                : Colors.transparent,
                            const Offset(0, 0),
                            "assets/Smiley.svg",
                            "Order Delivered",
                            "Your order has been delivered",
                            "done",
                            deliveredBoxValue
                                ? KConstants.baseTwoRedColor
                                : KConstants.baseFourGreyColor,
                            deliveredBoxValue
                                ? KConstants.baseDarkColor
                                : KConstants.baseFourGreyColor,
                          ),
                        ],
                      );
                    }, error: (error, _) {
                      return Text(error.toString());
                    }, loading: () {
                      return ListView(
                        children: [
                          Shimmer.fromColors(
                            baseColor: KConstants.baseFourGreyColor,
                            highlightColor: KConstants.baseThreeGreyColor,
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              width: screenWidth * .7,
                              height: screenHeight * .1,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Shimmer.fromColors(
                            baseColor: KConstants.baseFourGreyColor,
                            highlightColor: KConstants.baseThreeGreyColor,
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              width: screenWidth * .7,
                              height: screenHeight * .1,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Shimmer.fromColors(
                            baseColor: KConstants.baseFourGreyColor,
                            highlightColor: KConstants.baseThreeGreyColor,
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              width: screenWidth * .7,
                              height: screenHeight * .1,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Shimmer.fromColors(
                            baseColor: KConstants.baseFourGreyColor,
                            highlightColor: KConstants.baseThreeGreyColor,
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              width: screenWidth * .7,
                              height: screenHeight * .1,
                            ),
                          )
                        ],
                      );
                    }),
                  ),
                  Center(
                    child: SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () => confirmOrder
                            ? _confirmDelivery(orderId, "completed")
                            : null,
                        style: ButtonStyle(
                            backgroundColor: confirmOrder
                                ? MaterialStateProperty.all(
                                    KConstants.baseTwoRedColor)
                                : MaterialStateProperty.all(
                                    KConstants.baseFourDarkColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            )),
                        child: const Text(
                          'Confirm Delivery',
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  )
                ],
              ),
            )),
      ),
    );
  }
}
