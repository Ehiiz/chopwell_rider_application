import 'package:chopwell_rider_application/constants/constants.dart';
import 'package:chopwell_rider_application/models/request_models/set_delivery_status_request_model.dart';
import 'package:chopwell_rider_application/screens/Nav_Pages/ordersPage.dart';
import 'package:chopwell_rider_application/screens/micro_components/class_Components.dart';
import 'package:chopwell_rider_application/screens/registration_page/loginPage.dart';
import 'package:chopwell_rider_application/screens/subPages/orderProgressPage.dart';
import 'package:chopwell_rider_application/services/update_delivery_status_service.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

final orderIdProvider = StateProvider<String>((ref) => "");

class OrderFavouritesBox extends ConsumerStatefulWidget {
  OrderFavouritesBox(
    this.favourite,
    //   this.restaurantImage,
    // this.restaurantName,
    this.orderStatus,
    this.mealDetails,
    this.date,
    this.amount,
    this.orderId,
    this.restaurantName,
    this.total,
    this.deliveryFee,
    this.vat,
    this.account,
    this.status,
    this.preOrder,
    this.deliveryTime,
  );
  //
  bool favourite;
  bool orderStatus;

  List<dynamic> mealDetails;
  String date;
  String amount;
  String orderId;
  String restaurantName;
  String total;
  String deliveryFee;
  String vat;
  String account;
  String status;
  bool preOrder;
  int? deliveryTime;

  @override
  ConsumerState<OrderFavouritesBox> createState() => _OrderFavouritesBoxState(
        this.favourite,
        this.orderStatus,
        this.mealDetails,
        this.date,
        this.amount,
        this.orderId,
        this.restaurantName,
        this.total,
        this.deliveryFee,
        this.vat,
        this.account,
        this.status,
        this.preOrder,
        this.deliveryTime,
      );
}

class _OrderFavouritesBoxState extends ConsumerState<OrderFavouritesBox> {
  _OrderFavouritesBoxState(
    this.favourite,
    this.orderStatus,
    this.mealDetails,
    this.date,
    this.amount,
    this.orderId,
    this.restaurantName,
    this.total,
    this.deliveryFee,
    this.vat,
    this.account,
    this.status,
    this.preOrder,
    this.deliveryTime,
  );

  final bool favourite;
  final bool orderStatus;
  final List<dynamic> mealDetails;
  final String date;
  final String amount;
  final String orderId;
  final String restaurantName;
  final String total;
  final String deliveryFee;
  final String vat;
  final String account;
  final String status;
  final bool preOrder;
  final int? deliveryTime;

  bool _showProgressIndicator = false;
  bool _showRejectIndicator = false;

  @override
  Widget build(BuildContext context) {
    final dateTime = DateTime.parse(date);
    final formattedDate = DateFormat('MMMM d, y').format(dateTime);
    final formattedTime = DateFormat('h:mm a').format(dateTime);

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    //create a reject logic

    void _acceptOrder() async {
      setState(() {
        _showProgressIndicator = true;
      });
      final request = SetDeliveryStatusRequestModel(order_status: "accepted");
      final response = await UpdateDeliveryStatus(orderId).status(request);

      if (response.status == "success") {
        setState(() {
          _showProgressIndicator = false;
        });
        ScaffoldMessenger.of(context)
            .showSnackBar(customSuccessBar("Order accepted"));

        ref.refresh(riderOrderFutureProvider);
      } else {
        setState(() {
          _showProgressIndicator = false;
        });
        ScaffoldMessenger.of(context)
            .showSnackBar(customErrorBar("Unable to accept order"));
      }
    }

    void _rejectOrder() async {
      setState(() {
        _showProgressIndicator = true;
      });
      final request = SetDeliveryStatusRequestModel(order_status: "cancelled");
      final response = await UpdateDeliveryStatus(orderId).status(request);

      if (response.status == "success") {
        setState(() {
          _showProgressIndicator = false;
        });
        ScaffoldMessenger.of(context)
            .showSnackBar(customSuccessBar("Order accepted"));

        ref.refresh(riderOrderFutureProvider);
      } else {
        setState(() {
          _showProgressIndicator = false;
        });
        ScaffoldMessenger.of(context)
            .showSnackBar(customErrorBar("Unable to accept order"));
      }
    }

    return GestureDetector(
        onTap: () {
          ref.read(orderIdProvider.notifier).state = orderId;
          pushNewScreen(
            context,
            screen: ConfirmationPage(
              orderId: orderId,
            ),
            withNavBar: false, // OPTIONAL VALUE. True by default.
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 10.0),
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          decoration: BoxDecoration(boxShadow: const [
            BoxShadow(
                color: Color(0x1A5A6CEA),
                offset: Offset(1.0, 2.0),
                blurRadius: 20.0,
                spreadRadius: 0.0),
          ], color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            children: [
              preOrder
                  ? Text(
                      "preorder",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        color: KConstants.baseOrangeColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                      ),
                    )
                  : Container(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    "assets/Restaurant.svg",
                    width: 40,
                    height: 40,
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    restaurantName,
                    style: TextStyle(
                      fontFamily: "Questrial",
                      fontSize: 20,
                      color: KConstants.baseDarkColor,
                    ),
                  ),
                  const SizedBox(
                    width: 35,
                  ),
                  favourite
                      ? const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 30,
                        )
                      : Container()
                ],
              ),
              const SizedBox(height: 5),

              TextsWidgets(
                text: 'Meal Details',
                textPrice: '',
                textColor: KConstants.baseTwoDarkColor,
                textWeight: FontWeight.bold,
                textSize: 15,
              ),
              const SizedBox(height: 15),
              ListView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: mealDetails.length,
                itemBuilder: (BuildContext context, int index) => TextsWidgets(
                  text: mealDetails[index]["food_name"],
                  textPrice: "₦${mealDetails[index]["food_price"]}",
                  textColor: Colors.black,
                  textSize: 18.0,
                  textWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 15),
              TextsWidgets(
                text: "Food Cost",
                textPrice: "₦$amount",
                textWeight: FontWeight.w500,
                textColor: Colors.black,
                textSize: 20.0,
              ),
              const SizedBox(height: 10),

              //delivery fee here
              TextsWidgets(
                text: 'Delivery',
                textPrice: "₦$deliveryFee",
                textWeight: FontWeight.w500,
                textColor: Colors.black,
                textSize: 20.0,
              ),
              const SizedBox(height: 10),
              TextsWidgets(
                text: "VAT",
                textPrice: "₦$vat",
                textColor: Colors.black,
                textWeight: FontWeight.w500,
                textSize: 20.0,
              ),
              const SizedBox(height: 10),
              TextsWidgets(
                text: 'Total',
                textPrice: "₦$total",
                textColor: Colors.black,
                textWeight: FontWeight.bold,
                textSize: 20.0,
              ),
              const SizedBox(height: 20),
              // TextsWidgets(
              //   text: "account",
              //   textPrice: account,
              //   textColor: KConstants.baseTwoDarkColor,
              //   textWeight: FontWeight.w600,
              //   textSize: 20.0,
              // ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formattedTime,
                    style: TextStyle(
                      color: KConstants.baseDarkColor,
                      fontSize: 17,
                      fontFamily: "Montserrat",
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      pushNewScreen(
                        context,
                        screen: ConfirmationPage(
                          orderId: orderId,
                        ),
                        withNavBar: false, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                    child: Text(
                      status,
                      style: TextStyle(
                        color: orderStatus
                            ? KConstants.baseGreyColor
                            : KConstants.baseAccentColor,
                        fontSize: 17,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              status == "pending"
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              width: screenWidth * .45,
                              height: 60,
                              child: OutlinedButton(
                                onPressed: () {
                                  _acceptOrder();
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    KConstants.baseGreenColor,
                                  ),
                                  padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(
                                        vertical: 15.0, horizontal: 15.0),
                                  ),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        15.0,
                                      ), // Set your desired border radius here
                                      side: BorderSide.none,
                                    ),
                                  ),
                                  // minimumSize: MaterialStateProperty.all(
                                  //   Size(screenWidth * .45, 40),
                                  // ),
                                ),
                                child: Text(
                                  _showProgressIndicator ? "" : "accept",
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
                              // ignore: dead_code
                              const Positioned.fill(
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        Stack(
                          children: [
                            SizedBox(
                              width: screenWidth * .35,
                              height: 60,
                              child: OutlinedButton(
                                onPressed: () {
                                  _rejectOrder();
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    KConstants.baseThreeDarkColor,
                                  ),
                                  padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(
                                        vertical: 15.0, horizontal: 15.0),
                                  ),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          15.0), // Set your desired border radius here
                                      side: BorderSide.none,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "reject",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            if (_showRejectIndicator)
                              // ignore: dead_code
                              const Positioned.fill(
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                          ],
                        )
                      ],
                    )
                  : Container()
            ],
          ),
        ));
  }
}
