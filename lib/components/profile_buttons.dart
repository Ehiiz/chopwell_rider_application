import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:chopwell_merchant_application/Nav_Pages/ordersPage.dart';

class ProfileButtons extends StatelessWidget {
  ProfileButtons(this.icon, this.menuName, this.page);

  String icon;
  String menuName;
  Widget page;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return page;
                }));
              },
              icon: SvgPicture.asset(icon)),
          SizedBox(
            width: 10,
          ),
          Text(
            menuName,
            style: TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
          ),
        ],
      ),
    );
  }
}
