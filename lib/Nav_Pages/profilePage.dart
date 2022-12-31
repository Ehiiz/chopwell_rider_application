import 'package:chopwell_merchant_application/Nav_Pages/ordersPage.dart';
import 'package:chopwell_merchant_application/components/profile_buttons.dart';
import 'package:chopwell_merchant_application/subPages/favouritesPage.dart';
import 'package:chopwell_merchant_application/subPages/payoutHistoryPage.dart';
import 'package:flutter/material.dart';
import 'package:chopwell_merchant_application/constants/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:chopwell_merchant_application/subPages/bankWithdrawalDetailsPage.dart';
import 'package:chopwell_merchant_application/subPages/orderHistoryPage.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyProfilePage();
  }
}

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.01,
              horizontal: screenWidth * 0.02,
            ),
            child: ListView(
              children: [
                Row(
                  children: [
                    Text(
                      'Profile',
                      style: Theme.of(context).primaryTextTheme.titleLarge,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage("images/jose 1.jpg"),
                        // backgroundColor: KConstants.baseGreenColor,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Peter Obi',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: KConstants.baseDarkColor,
                          fontSize: 30,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/location.svg",
                            width: 25,
                            height: 25,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'Apo Resettlement, Abuja ',
                            style: TextStyle(
                                fontSize: 18, fontFamily: 'Montserrat'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    ProfileButtons("assets/card.svg", "Store Details",
                        BankWithdrawalDetailsPage()),
                    ProfileButtons("assets/coupon.svg", "Payment Details",
                        BankWithdrawalDetailsPage()),
                    ProfileButtons("assets/order_history.svg", "Order History",
                        OrderHistoryPage()),
                    ProfileButtons("assets/order_history.svg", "Payout History",
                        PayoutHistoryPage()),
                    ProfileButtons("assets/help.svg", "Help", FavouritePage())
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
