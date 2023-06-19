import 'package:alarm/alarm.dart';
import 'package:chopwell_rider_application/screens/micro_components/order_favourites.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../constants/constants.dart';

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
    required this.status,
    required this.location,
    required this.deliveryLocation,
    required this.preOrder,
    required this.deliveryTime,
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
  String status;
  bool preOrder;
  int? deliveryTime;
  Map<String, dynamic> location;
  Map<String, dynamic> deliveryLocation;

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
                  account,
                  status,
                  preOrder,
                  deliveryTime,
                ),
                preOrder
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: screenWidth * .6,
                                child: Text(
                                  "Preorder",
                                  maxLines: 1,
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(
                                    color: KConstants.baseDarkColor,
                                    fontSize: 15,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                "$deliveryTime",
                                maxLines: 1,
                                // ignore: prefer_const_constructors
                                style: TextStyle(
                                  color: KConstants.baseDarkColor,
                                  fontSize: 12,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                              onPressed: () async {
                                DateTime prepTime = DateTime.now()
                                    .add(Duration(hours: deliveryTime!));

                                _setAlarm(
                                    "You have a pre order pickup for $restaurantName by $prepTime ",
                                    prepTime!,
                                    "Preorder delivery for $restaurantName");
                              },
                              child: Text(
                                "set reminder",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  color: KConstants.baseRedColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ))
                        ],
                      )
                    : Container(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: screenWidth * .6,
                          child: Text(
                            location["address"],
                            maxLines: 1,
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                              color: KConstants.baseDarkColor,
                              fontSize: 15,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          "Restaurant Address",
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                            color: KConstants.baseGreyColor,
                            fontSize: 12,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    TextButton(
                        onPressed: () async {
                          _openMap(location["latitude"], location["longitude"]);
                        },
                        child: Text(
                          "directions",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            color: KConstants.baseRedColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: screenWidth * .6,
                          child: Text(
                            deliveryLocation["deliveryAddress"],
                            maxLines: 1,
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                              color: KConstants.baseDarkColor,
                              fontSize: 15,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          "Restaurant Address",
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                            color: KConstants.baseGreyColor,
                            fontSize: 12,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    TextButton(
                        onPressed: () async {
                          _openMap(deliveryLocation["deliveryLatitude"],
                              deliveryLocation["deliveryLongitude"]);
                        },
                        child: Text(
                          "directions",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            color: KConstants.baseRedColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  void _openMap(double latitude, double longitude) async {
    final url =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _setAlarm(String message, DateTime timer, String title) async {
    final alarmSettings = AlarmSettings(
      id: 42,
      dateTime: timer,
      assetAudioPath: 'assets/alarm.mp3',
      loopAudio: true,
      vibrate: true,
      fadeDuration: 5.0,
      notificationTitle: title,
      notificationBody: message,
      enableNotificationOnKill: true,
    );

    await Alarm.set(alarmSettings: alarmSettings);
  }
}
