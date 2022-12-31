import 'package:chopwell_merchant_application/components/add_food.dart';
import 'package:chopwell_merchant_application/components/order_progress_bar.dart';
import 'package:chopwell_merchant_application/components/product_list.dart';
import 'package:chopwell_merchant_application/components/restaurant_box.dart';
import 'package:flutter/material.dart';
import 'package:chopwell_merchant_application/constants/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:chopwell_merchant_application/registration_page/loginPage.dart';
import 'package:chopwell_merchant_application/Nav_Pages/searchPage.dart';
import 'package:chopwell_merchant_application/subPages/restaurantPage.dart';

//VERTICALCARD CLASS

class VerticalCard extends StatelessWidget {
  VerticalCard(this.name, this.description, this.restaurantLogo, this.status);

  String name;
  String description;
  String restaurantLogo;
  bool status;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return RestaurantPage();
          }));
        },
        child: Container(
            width: 200,
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white70),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0x1A5A6CEA),
                              offset: Offset(3.0, 2.0),
                              blurRadius: 5.0,
                              spreadRadius: 0.0)
                        ]),
                    width: 150,
                    height: 150,
                    child: Image.asset(
                      restaurantLogo,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(name,
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              description,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                  fontFamily: "Questrial"),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}

//GRIDCARD CLASS

class GridCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return RestaurantPage();
        }));
      },
      child: Container(
          width: 400,
          color: Color(0xffF9FAFE),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Image.asset(
                  'images/e89.png',
                ),
              );
            },
          )),
    );
  }
}
