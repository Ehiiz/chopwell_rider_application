import 'package:chopwell_rider_application/constants/constants.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
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
          )),
      actions: []);
}

AppBar buildNavAppBar(BuildContext context, String title, double width) {
  return AppBar(
    elevation: 0.0,
    backgroundColor: Colors.white,
    actions: [
      Container(
        width: width,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: "Questrial",
                  fontSize: 30.0,
                  color: KConstants.baseDarkColor,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
