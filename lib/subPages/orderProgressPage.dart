import 'package:chopwell_merchant_application/components/add_food.dart';
import 'package:chopwell_merchant_application/components/order_progress_bar.dart';
import 'package:chopwell_merchant_application/components/product_list.dart';
import 'package:chopwell_merchant_application/components/restaurant_box.dart';
import 'package:chopwell_merchant_application/Nav_Pages/searchPage.dart';
import 'package:flutter/material.dart';
import 'package:chopwell_merchant_application/constants/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:chopwell_merchant_application/registration_page/loginPage.dart';
import '../home_page/card_class.dart';
import 'package:chopwell_merchant_application/subPages/restaurantPage.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              shadowColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 25,
                ),
              ),
              actions: [
                IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 25,
                    ))
              ],
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.01,
                horizontal: screenWidth * 0.02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Progress',
                    style: Theme.of(context).primaryTextTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/location.svg"),
                      Text(
                        'Apo Resettlement, Abuja',
                        style:
                            TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        OrderProgressBar(
                            KConstants.baseFourGreyColor,
                            Offset(5, 5),
                            "assets/Restaurant.svg",
                            "Restaurant Accepted",
                            "Order #12345 is being prepared",
                            "11:15 am",
                            KConstants.baseGreyColor,
                            KConstants.baseGreyColor),
                        OrderProgressBar(
                          KConstants.baseFourGreyColor,
                          Offset(5, 5),
                          "assets/Food.svg",
                          "Order Ready",
                          "Order #12345 is ready for pick up",
                          "12:00 pm",
                          KConstants.baseGreyColor,
                          KConstants.baseGreyColor,
                        ),
                        OrderProgressBar(
                            Color(0x1A5A6CEA),
                            Offset(5, 5),
                            "assets/food_location.svg",
                            "Rider Picked up",
                            "Rider is on his way to you",
                            "12:35 pm",
                            KConstants.baseRedColor,
                            KConstants.baseDarkColor),
                        OrderProgressBar(
                            Colors.transparent,
                            Offset(0, 0),
                            "assets/Smiley.svg",
                            "Order Delivered",
                            "Order #12345 has been delivered",
                            "-- : -- pm",
                            KConstants.baseFourGreyColor,
                            KConstants.baseFourGreyColor),
                      ],
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: null,
                        child: Text(
                          'Confirm Delivery',
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                KConstants.baseTwoRedColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  )
                ],
              ),
            )),
      ),
    );
  }
}
// OrderProgressBar(Colors.red, Offset(22, 2), 'cons')
