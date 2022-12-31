import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:chopwell_merchant_application/constants/constants.dart';

class OrderProgressBar extends StatelessWidget {
  OrderProgressBar(this.colour, this.offset, this.icon, this.orderStatus,
      this.orderDetails, this.orderTime, this.statusColour, this.detailsColor);

  Color colour;
  Offset offset;
  String icon;
  String orderStatus;
  String orderDetails;
  String orderTime;
  Color statusColour;
  Color detailsColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: colour,
                offset: offset,
                blurRadius: 50.0,
                spreadRadius: 0.0)
          ],
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            icon,
            width: 40,
            height: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                orderStatus,
                style: TextStyle(
                    color: statusColour,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserrat"),
              ),
              const SizedBox(
                width: 5.0,
              ),
              Text(
                orderDetails,
                style: TextStyle(
                    color: detailsColor,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserrat"),
              ),
            ],
          ),
          const SizedBox(
            width: 15.0,
          ),
          Text(
            orderTime,
            textAlign: TextAlign.right,
            style: TextStyle(
                color: detailsColor,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Montserrat"),
          )
        ],
      ),
    );
  }
}
