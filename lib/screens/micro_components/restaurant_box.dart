import 'package:chopwell_rider_application/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RestaurantBox extends StatelessWidget {
  const RestaurantBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color(0x1A5A6CEA),
                offset: Offset(12.0, 26.0),
                blurRadius: 50.0,
                spreadRadius: 0.0)
          ],
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.0),
              topLeft: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0),
              bottomLeft: Radius.circular(16.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage("images/Rectangle 6.png"),
            width: 120.0,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10.0, top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Bubbel and Brie",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                const Center(
                  child: Text(
                    "Ugbowo",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 15.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Container(
                          height: 35,
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                              color: KConstants.baseTwoRedColor,
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0))),
                          child: const Text(
                            "ADD",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 18.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        )),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        "assets/Icon Minus.svg",
                        color: KConstants.baseGreyColor,
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
