import 'package:chopwell_rider_application/constants/constants.dart';
import 'package:chopwell_rider_application/screens/micro_components/class_Components.dart';
import 'package:chopwell_rider_application/screens/subPages/orderProgressPage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderIdProvider = StateProvider<String>((ref) => "");

class OrderFavouritesBox extends ConsumerWidget {
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
      this.account);
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

  // String restaurantImage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateTime = DateTime.parse(date);
    final formattedDateTime = DateFormat('yyyy-MM-dd h:mm a').format(dateTime);

    return GestureDetector(
        onTap: () {
          ref.read(orderIdProvider.notifier).state = orderId;

          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ConfirmationPage(orderId: orderId);
          }));
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
                    textPrice: mealDetails[index]["food_price"],
                    textColor: KConstants.baseGreyColor,
                    textSize: 18.0,
                    textWeight: FontWeight.normal),
              ),
              const SizedBox(height: 15),
              TextsWidgets(
                text: "Food Cost",
                textPrice: "₦$amount",
                textWeight: FontWeight.w500,
                textColor: KConstants.baseGreyColor,
                textSize: 20.0,
              ),
              const SizedBox(height: 10),

              //delivery fee here
              TextsWidgets(
                text: 'Delivery',
                textPrice: "₦$deliveryFee",
                textWeight: FontWeight.w500,
                textColor: KConstants.baseGreyColor,
                textSize: 20.0,
              ),
              const SizedBox(height: 10),
              TextsWidgets(
                text: "VAT",
                textPrice: "₦$vat",
                textColor: KConstants.baseGreyColor,
                textWeight: FontWeight.w500,
                textSize: 20.0,
              ),
              const SizedBox(height: 10),
              TextsWidgets(
                text: 'Total',
                textPrice: "₦$total",
                textColor: KConstants.baseDarkColor,
                textWeight: FontWeight.bold,
                textSize: 20.0,
              ),
              const SizedBox(height: 20),
              TextsWidgets(
                text: "account",
                textPrice: account,
                textColor: KConstants.baseTwoDarkColor,
                textWeight: FontWeight.w600,
                textSize: 20.0,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formattedDateTime,
                    style: TextStyle(
                      color: KConstants.baseDarkColor,
                      fontSize: 17,
                      fontFamily: "Montserrat",
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ConfirmationPage(
                          orderId: orderId,
                        );
                      }));
                    },
                    child: Text(
                      orderStatus ? "completed" : "progress",
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
            ],
          ),
        ));
  }
}
