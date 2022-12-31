import 'package:flutter/material.dart';
import 'package:chopwell_merchant_application/constants/constants.dart';
import 'package:chopwell_merchant_application/components/order_favourites.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.01,
            horizontal: screenWidth * 0.02,
          ),
          child: ListView(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Favourites',
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: KConstants.baseDarkColor,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                OrderFavouritesBox(true, false),
                OrderFavouritesBox(true, false),
                OrderFavouritesBox(true, false),
                OrderFavouritesBox(true, false),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
