import 'package:chopwell_rider_application/screens/micro_components/order_favourites.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SingleOrderDetailsPage extends StatelessWidget {
  SingleOrderDetailsPage({
    Key? key,
    required this.orderStatus,
    required this.mealDetails,
    required this.date,
    required this.amount,
    required this.orderId,
    required this.restaurantName,
    required this.total,
    required this.deliveryFee,
    required this.vat,
    required this.account,
  }) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
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
          actions: const [
            IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 25,
                ))
          ],
        ),
        body: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * .05),
            child: ListView(
              children: [
                const SizedBox(
                  height: 30,
                ),
                OrderFavouritesBox(
                    false,
                    orderStatus,
                    mealDetails,
                    date,
                    amount,
                    orderId,
                    restaurantName,
                    total,
                    deliveryFee,
                    vat,
                    account)
              ],
            ),
          ),
        ));
  }
}
