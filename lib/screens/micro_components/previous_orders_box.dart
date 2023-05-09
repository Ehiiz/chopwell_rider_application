import 'package:chopwell_rider_application/constants/constants.dart';
import 'package:chopwell_rider_application/screens/micro_components/order_favourites.dart';
import 'package:chopwell_rider_application/screens/subPages/orderProgressPage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class PreviousOrderBox extends ConsumerWidget {
  PreviousOrderBox(this.date, this.amount, this.restaurantName, this.orderId);

  String date;
  String amount;
  String restaurantName;
  String orderId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateTime = DateTime.parse(date);
    final formattedDateTime = DateFormat('yyyy-MM-dd h:mm a').format(dateTime);
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
          ;
        },
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          margin: EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 44,
                      minHeight: 44,
                      maxWidth: 80,
                      maxHeight: 100,
                    ),
                    child: SvgPicture.asset("assets/Restaurant.svg"),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          formattedDateTime,
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Montserrat",
                            color: KConstants.baseTwoGreyColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          amount,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Montserrat",
                            color: KConstants.baseTwoDarkColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          restaurantName,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                            color: KConstants.baseDarkColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 30,
                color: KConstants.baseDarkColor,
              ),
            ],
          ),
        ));
  }
}
