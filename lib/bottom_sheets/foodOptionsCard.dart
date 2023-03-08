import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:chopwell_rider_application/constants/constants.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class FoodOptionsCard extends StatefulWidget {
  @override
  State<FoodOptionsCard> createState() => _FoodOptionsCardState();
}

enum Font { montserrat, timesNewRoman, questrial, arial }

class _FoodOptionsCardState extends State<FoodOptionsCard> {
  Font? _font = Font.montserrat;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Builder(
            builder: (context) => TextButton(
              onPressed: () => SheetController.of(context)!.expand(),
              child: Text("view in full"),
            ),
          ),
          Text(
            "choose an option below",
            style: TextStyle(
                fontFamily: "Montserrat",
                fontStyle: FontStyle.normal,
                color: KConstants.baseGreyColor,
                fontSize: 20.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Drinks",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          color: KConstants.baseRedColor,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "100",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          color: KConstants.baseDarkColor,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Coke",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              color: KConstants.baseDarkColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Radio<Font>(
                            value: Font.timesNewRoman,
                            activeColor: KConstants.baseGreyColor,
                            groupValue: _font,
                            onChanged: (Font? value) {
                              setState(() {
                                _font = value;
                              });
                            })
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Drinks",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          color: KConstants.baseRedColor,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "100",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          color: KConstants.baseDarkColor,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Coke",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              color: KConstants.baseDarkColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Radio<Font>(
                            value: Font.timesNewRoman,
                            activeColor: KConstants.baseGreyColor,
                            groupValue: _font,
                            onChanged: (Font? value) {
                              setState(() {
                                _font = value;
                              });
                            })
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Drinks",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          color: KConstants.baseRedColor,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "100",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          color: KConstants.baseDarkColor,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Coke",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              color: KConstants.baseDarkColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Radio<Font>(
                            value: Font.timesNewRoman,
                            activeColor: KConstants.baseGreyColor,
                            groupValue: _font,
                            onChanged: (Font? value) {
                              setState(() {
                                _font = value;
                              });
                            })
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Drinks",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          color: KConstants.baseRedColor,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "100",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          color: KConstants.baseDarkColor,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Coke",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              color: KConstants.baseDarkColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Radio<Font>(
                            value: Font.timesNewRoman,
                            activeColor: KConstants.baseGreyColor,
                            groupValue: _font,
                            onChanged: (Font? value) {
                              setState(() {
                                _font = value;
                              });
                            })
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Drinks",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          color: KConstants.baseRedColor,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "100",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          color: KConstants.baseDarkColor,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Coke",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              color: KConstants.baseDarkColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Radio<Font>(
                            value: Font.timesNewRoman,
                            activeColor: KConstants.baseGreyColor,
                            groupValue: _font,
                            onChanged: (Font? value) {
                              setState(() {
                                _font = value;
                              });
                            })
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Drinks",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          color: KConstants.baseRedColor,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "100",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          color: KConstants.baseDarkColor,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Coke",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              color: KConstants.baseDarkColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Radio<Font>(
                            value: Font.timesNewRoman,
                            activeColor: KConstants.baseGreyColor,
                            groupValue: _font,
                            onChanged: (Font? value) {
                              setState(() {
                                _font = value;
                              });
                            })
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
