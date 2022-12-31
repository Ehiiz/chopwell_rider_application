import 'package:chopwell_merchant_application/constants/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';
import 'package:flutter/material.dart';

class PreviousOrderBox extends StatelessWidget {
  PreviousOrderBox(
      this.restaurantLogo, this.date, this.amount, this.restaurantName);

  String restaurantLogo;
  String date;
  String amount;
  String restaurantName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        // boxShadow: [
        //   BoxShadow(
        //       color: KConstants.baseFourGreyColor,
        //       offset: Offset(2.0, 3.0),
        //       blurRadius: 10.0,
        //       spreadRadius: 0.0)
        // ],
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 44,
                  minHeight: 44,
                  maxWidth: 80,
                  maxHeight: 100,
                ),
                child: Image.asset(restaurantLogo),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      date,
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
    );
  }
}
