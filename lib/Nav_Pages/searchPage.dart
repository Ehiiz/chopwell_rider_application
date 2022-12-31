import 'package:chopwell_merchant_application/components/add_food.dart';
import 'package:chopwell_merchant_application/components/order_progress_bar.dart';
import 'package:chopwell_merchant_application/components/product_list.dart';
import 'package:chopwell_merchant_application/components/restaurant_box.dart';
import 'package:flutter/material.dart';
import 'package:chopwell_merchant_application/Nav_Pages/homePage.dart';
import 'package:chopwell_merchant_application/constants/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:chopwell_merchant_application/registration_page/loginPage.dart';
import '../home_page/card_class.dart';
import 'package:chopwell_merchant_application/components/search_page_box.dart';

class SearchNav extends StatelessWidget {
  const SearchNav({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

int _currentIndex = 0;

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Container(
          padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
          width: screenWidth,
          height: 35,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(100.0),
            ),
          ),
          child: Material(
            elevation: 0.5,
            shadowColor: Color(0x59D9D9D9),
            borderRadius: const BorderRadius.all(Radius.circular(100.0)),
            child: TextField(
              style: const TextStyle(fontSize: 15, fontFamily: "Questrial"),
              maxLines: 1,
              decoration: InputDecoration(
                fillColor: Colors.white,
                suffixIcon: SvgPicture.asset(
                  "assets/Search.svg",
                  color: KConstants.baseTwoRedColor,
                  fit: BoxFit.scaleDown,
                  width: 15,
                  height: 15,
                ),
                labelText: "search for meals or restaurants",
                labelStyle: TextStyle(
                  color: KConstants.baseDarkColor,
                  fontSize: 15,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(100.0),
                  ),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 90,
        width: 90,
        child: FloatingActionButton.extended(
          onPressed: null,
          label: Column(
            children: [
              SvgPicture.asset("assets/bag_shop.svg"),
              Text('\$500',
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ))
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          backgroundColor: KConstants.baseDarkColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.01, horizontal: screenWidth * 0.02),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                RestaurantFullData.chopwellRestaurants.length,
                (index) => SearchPageBox(
                    RestaurantFullData
                        .chopwellRestaurants[index].restaurantName,
                    KConstants.foodImages,
                    RestaurantFullData
                        .chopwellRestaurants[index].restaurantLocation,
                    RestaurantFullData
                        .chopwellRestaurants[index].restaurantDelivery,
                    KConstants.foodName),
              )),
        ),
      ),
    ));
  }
}
