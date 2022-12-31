import 'package:chopwell_merchant_application/components/class_Components.dart';
import 'package:chopwell_merchant_application/subPages/orderProgressPage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:chopwell_merchant_application/constants/constants.dart';

class OrderFavouritesBox extends StatelessWidget {
  OrderFavouritesBox(
      this.favourite,
      //   this.restaurantImage, this.restaurantName, this.mealDetails,
      this.orderStatus);
  //
  bool favourite;
  // String restaurantName;
  // List<dynamic> mealDetails;
  bool orderStatus;
  // String restaurantImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      decoration: BoxDecoration(boxShadow: [
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
              Image.asset(
                "images/Res-2.png",
                width: 40,
                height: 40,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Chicken Republic",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 20,
                  color: KConstants.baseDarkColor,
                ),
              ),
              SizedBox(
                width: 35,
              ),
              favourite
                  ? Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 30,
                    )
                  : Container()
            ],
          ),
          SizedBox(height: 15),
          TextsWidgets(
              text: 'Plantain',
              textPrice: '50',
              textColor: KConstants.baseGreyColor),
          SizedBox(height: 5),
          TextsWidgets(
              text: 'Rice',
              textPrice: '80',
              textColor: KConstants.baseGreyColor),
          SizedBox(height: 5),
          TextsWidgets(
              text: 'Beans',
              textPrice: '900',
              textColor: KConstants.baseGreyColor),
          SizedBox(height: 5),
          TextsWidgets(
              text: 'Coke',
              textPrice: '1000',
              textColor: KConstants.baseGreyColor),
          SizedBox(height: 30),
          TextsWidgets(
              text: 'Delivery', textPrice: '3000', textColor: Colors.black),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 200,
                height: 45,
                child: OutlinedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(KConstants.baseGreenColor),
                    ),
                    child: Text(
                      'accept',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )),
              ),
              SizedBox(
                width: 150,
                height: 45,
                child: OutlinedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(KConstants.baseGreyColor),
                    ),
                    child: Text(
                      'decline',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '08:45',
                style: TextStyle(
                  color: KConstants.baseDarkColor,
                  fontSize: 20,
                  fontFamily: "Montserrat",
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ConfirmationPage();
                  }));
                },
                child: Text(
                  orderStatus ? 'in progress' : 'completed',
                  style: TextStyle(
                    color: orderStatus
                        ? KConstants.baseAccentColor
                        : KConstants.baseGreenColor,
                    fontSize: 20,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
