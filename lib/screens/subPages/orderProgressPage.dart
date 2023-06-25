import 'package:chopwell_rider_application/constants/constants.dart';
import 'package:chopwell_rider_application/models/request_models/set_delivery_status_request_model.dart';
import 'package:chopwell_rider_application/models/response_models/map_based_response_model.dart';
import 'package:chopwell_rider_application/screens/micro_components/order_favourites.dart';
import 'package:chopwell_rider_application/screens/micro_components/order_progress_bar.dart';
import 'package:chopwell_rider_application/screens/registration_page/loginPage.dart';
import 'package:chopwell_rider_application/services/single_order_detail_service.dart';
import 'package:chopwell_rider_application/services/update_delivery_status_service.dart';
import 'package:chopwell_rider_application/screens/subPages/singleOrderDetailsPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

final singleProductFutureProvider =
    FutureProvider.autoDispose<MapDataResponseModel>((ref) async {
  final singleProductService = ref.watch(singleOrderProvider);
  final orderId = ref.watch(orderIdProvider);
  return singleProductService.orderDetail(orderId);
});

class ConfirmationPage extends ConsumerStatefulWidget {
  ConfirmationPage({Key? key, required this.orderId}) : super(key: key);

  String orderId;

  @override
  ConsumerState<ConfirmationPage> createState() =>
      _ConfirmationPageState(orderId);
}

class _ConfirmationPageState extends ConsumerState<ConfirmationPage> {
  _ConfirmationPageState(this.orderId);

  String orderId;
  bool _showCircularIndicator = false;

  void _confirmDelivery(String orderId, String orderStatus) async {
    setState(() {
      _showCircularIndicator = true;
    });
    final request = SetDeliveryStatusRequestModel(order_status: orderStatus);

    final response = await UpdateDeliveryStatus(orderId).status(request);

    if (response.status == "success") {
      ScaffoldMessenger.of(context).showSnackBar(
          customSuccessBar("Order status updated to $orderStatus"));
      ref.refresh(singleProductFutureProvider);
      setState(() {
        _showCircularIndicator = false;
      });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(customErrorBar("Unable to update order"));
      setState(() {
        _showCircularIndicator = false;
      });
      ref.refresh(singleProductFutureProvider);
    }
  }

  void _launchPhone(String phoneNumber) async {
    final phoneUrl = 'tel:$phoneNumber';
    if (await canLaunchUrlString(phoneUrl)) {
      await launchUrlString(phoneUrl);
    } else {
      throw 'Could not launch $phoneUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final orderDetails = ref.watch(singleProductFutureProvider);
    bool confirmOrder = false;

    List<String> buttonClick = [
      "accepted",
      "picked",
      "delivering",
      "ready",
      "pending",
    ];

    List<String> acceptBox = [
      "accepted",
      "completed",
      "ready",
      "delivering",
      "delivered",
      "picked",
    ];

    final List<String> readyBox = [
      "completed",
      "ready",
      "delivering",
      "delivered",
      "picked",
    ];

    final List<String> deliveringBox = [
      "completed",
      "picked",
      "delivering",
      "delivered"
    ];

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
    String status = "";
    bool preOrder = false;
    int? deliveryTime;
    String restaurantPhoneNumber = "";
    String statusRequest = "completed";
    String currentId = "";
    Map<String, dynamic> location = {
      'address': '',
      'longitude': 0.0,
      'latitude': 0.0,
    };
    Map<String, dynamic> deliveryLocation = {
      'deliveryAddress': '',
      'deliveryLongitude': 0.0,
      'deliveryLatitude': 0.0,
    };
    bool clickButtonValue = false;

    void _callNumber(number) async {
      bool? res = await FlutterPhoneDirectCaller.callNumber(number);
    }

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
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.01,
              horizontal: screenWidth * 0.02,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Progress',
                    style: TextStyle(
                      fontFamily: "Questrial",
                      fontSize: 30.0,
                      color: KConstants.baseDarkColor,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  orderDetails.when(data: (data) {
                    String status = data.data["status"];
                    bool acceptBoxValue = acceptBox.contains(status);
                    bool readyBoxValue = readyBox.contains(status);
                    bool deliveringBoxValue = deliveringBox.contains(status);
                    bool deliveredBoxValue = deliveredBox.contains(status);
                    clickButtonValue = buttonClick.contains(status);
                    if (status == "accepted") {
                      statusRequest = "picked";
                    }
                    if (status == "ready") {
                      statusRequest = "picked";
                    }
                    if (status == "picked") {
                      statusRequest = "delivering";
                    }
                    if (status == "delivering") {
                      statusRequest = "delivered";
                    }

                    String phoneNumber = data.data["phoneNumber"];
                    address = data.data["location"]["address"];
                    mealDetails = data.data["order_details"]["food"];
                    date = data.data["created_at"].toString();
                    orderId = data.data["_id"];
                    amount = data.data["amount"].toString();
                    restaurantName = data.data["restaurant"]["name"].toString();
                    restaurantPhoneNumber =
                        data.data["restaurant"]["phoneNumber"].toString();
                    deliveryFee = data.data["deliveryFee"];
                    total = data.data["total"];
                    vat = data.data["vat"];
                    account = "";
                    status = data.data["status"];
                    preOrder = data.data["preOrder"]["status"] ?? false;
                    deliveryTime = data.data["preOrder"]["deliveryTime"] ?? 0;

                    return Column(
                      children: [
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
                                  Container(
                                    width: screenWidth * .45,
                                    child: Expanded(
                                      child: Text(
                                        address,
                                        maxLines: 1,
                                        overflow: TextOverflow.clip,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Montserrat'),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                pushNewScreen(
                                  context,
                                  screen: SingleOrderDetailsPage(
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
                                    status: status,
                                    location: location,
                                    deliveryLocation: deliveryLocation,
                                    preOrder: preOrder,
                                    deliveryTime: deliveryTime,
                                  ),
                                  withNavBar:
                                      false, // OPTIONAL VALUE. True by default.
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              },
                              child: Text(
                                "order details",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Questrial',
                                  fontWeight: FontWeight.bold,
                                  color: KConstants.baseTwoRedColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () async {
                                      _callNumber(phoneNumber);
                                      // _launchPhone(riderPhoneNumber);
                                    },
                                    icon: Icon(
                                      CupertinoIcons.phone_fill_arrow_up_right,
                                      color: KConstants.baseRedColor,
                                    )),
                                Text(
                                  "call customer",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: KConstants.baseRedColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () async {
                                      _callNumber(restaurantPhoneNumber);
                                      // _launchPhone(riderPhoneNumber);
                                    },
                                    icon: Icon(
                                      CupertinoIcons.phone_fill_arrow_up_right,
                                      color: KConstants.baseRedColor,
                                    )),
                                Text(
                                  "call restaurant",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: KConstants.baseRedColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                            height: screenHeight * .52,
                            child: ListView(
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
                            )),
                      ],
                    );
                  }, error: (error, _) {
                    return Text(error.toString());
                  }, loading: () {
                    return Column(
                      children: [
                        Shimmer.fromColors(
                          child: Container(width: 10),
                          baseColor: KConstants.baseFourGreyColor,
                          highlightColor: KConstants.baseThreeGreyColor,
                        ),
                        const SizedBox(
                          height: 5,
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
                  const SizedBox(
                    height: 25,
                  ),
                  Center(
                      child: Stack(
                    children: [
                      SizedBox(
                        width: 300,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: clickButtonValue
                              ? () async {
                                  _confirmDelivery(
                                    currentId,
                                    statusRequest,
                                  );
                                }
                              : null,
                          style: ButtonStyle(
                              backgroundColor: clickButtonValue
                                  ? MaterialStateProperty.all(
                                      KConstants.baseTwoRedColor,
                                    )
                                  : MaterialStateProperty.all(
                                      KConstants.baseFourDarkColor,
                                    ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              )),
                          child: Text(
                            _showCircularIndicator ? "" : statusRequest,
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      if (_showCircularIndicator)
                        // ignore: dead_code
                        const Positioned.fill(
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  )),
                  const SizedBox(
                    height: 25,
                  )
                ],
              ),
            ),
          )),
    );
  }
}
