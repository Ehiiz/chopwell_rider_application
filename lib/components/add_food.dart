import 'package:flutter/material.dart';
import 'package:chopwell_merchant_application/constants/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddFoodBox extends StatelessWidget {
  AddFoodBox(
      this.foodImage, this.foodName, this.searchPage, this.restaurantName);

  String foodImage;
  String foodName;
  bool searchPage;
  String restaurantName;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.32,
      height: screenHeight * 0.3,
      padding: EdgeInsets.symmetric(vertical: 2.0),
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color(0x1A5A6CEA),
                offset: Offset(3.0, 2.0),
                blurRadius: 5.0,
                spreadRadius: 0.0)
          ],
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      margin: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0),
            child: Container(
              width: screenWidth * 0.28,
              height: screenHeight * 0.15,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10.0),
                    child: Image(
                      width: 100,
                      fit: BoxFit.fill,
                      image: AssetImage(foodImage),
                    ),
                  ),
                  Positioned(
                    top: 2.0,
                    left: 35.0,
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Color(0x40000000),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        "\$300",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 120.0,
            child: Text(
              foodName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                color: KConstants.baseThreeDarkColor,
              ),
            ),
          ),
          !searchPage
              ? Text(
                  this.restaurantName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400),
                )
              : Container(),
          Container(
            margin: EdgeInsets.only(top: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Container(
                      height: 35,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 15.0),
                      decoration: BoxDecoration(
                          color: KConstants.baseTwoRedColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0))),
                      child: const Text(
                        "add",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    "assets/Icon Minus.svg",
                    color: KConstants.baseGreyColor,
                    width: 50,
                    height: 50,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
