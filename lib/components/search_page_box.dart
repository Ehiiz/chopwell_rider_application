import 'package:chopwell_merchant_application/components/add_food.dart';
import 'package:chopwell_merchant_application/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';

class SearchPageBox extends StatelessWidget {
  SearchPageBox(this.restaurantName, this.restaurantImage,
      this.restaurantLocation, this.restaurantDelivery, this.restaurantMeals);

  String restaurantName;
  List<String> restaurantImage;
  String restaurantLocation;
  String restaurantDelivery;
  List<String> restaurantMeals;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            restaurantName,
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset("assets/location.svg"),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    restaurantLocation,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontFamily: "Questrial"),
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset("assets/delivery_bike.svg"),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    restaurantDelivery,
                    style: TextStyle(
                        fontSize: 15,
                        color: KConstants.baseDarkColor,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 200.0,
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) => AddFoodBox(
                  restaurantImage[index],
                  restaurantMeals[index],
                  true,
                  restaurantName),
            ),
          ),
          SizedBox(
            height: 35,
          ),
        ],
      ),
    );
  }
}
