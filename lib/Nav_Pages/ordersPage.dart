import 'package:chopwell_merchant_application/components/previous_orders_box.dart';
import 'package:flutter/material.dart';
import 'package:chopwell_merchant_application/constants/constants.dart';
import 'package:chopwell_merchant_application/components/order_favourites.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Orders(),
      ),
    );
  }
}

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.01, horizontal: screenWidth * 0.02),
      child: ListView(children: [
        Text('Orders', style: Theme.of(context).primaryTextTheme.titleLarge),
        SizedBox(height: 10),
        Text(
          'current order',
          style: TextStyle(
            fontSize: 20,
            fontFamily: "Montserrat",
            color: KConstants.baseGreyColor,
          ),
        ),
        SizedBox(height: 15),
        OrderFavouritesBox(false, true),
        SizedBox(height: 15),
        Text(
          'previous orders',
          style: TextStyle(
              fontSize: 20,
              fontFamily: "Montserrat",
              color: KConstants.baseGreyColor),
        ),
        SizedBox(
          height: 10,
        ),
        Column(
          children: List.generate(
            FavouriteMealData.faveMeals.length,
            (index) => PreviousOrderBox(
                FavouriteMealData.faveMeals[index].restaurantImage,
                FavouriteMealData.faveMeals[index].date,
                FavouriteMealData.faveMeals[index].foodAmount,
                FavouriteMealData.faveMeals[index].restaurantName),
          ),
        )
      ]),
    );
  }
}
