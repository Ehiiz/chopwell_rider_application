import 'package:flutter/material.dart';
import 'package:chopwell_merchant_application/constants/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
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
            size: 25,
          ),
        ),
        actions: [
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.search,
                color: Colors.black,
                size: 25,
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.01, horizontal: screenWidth * 0.02),
        child: ListView(children: [
          Text('Delivery History',
              style: Theme.of(context).primaryTextTheme.titleLarge),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'june',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Montserrat",
                  color: KConstants.baseGreyColor,
                ),
              ),
              Text(
                "2000",
                style: TextStyle(
                    fontFamily: "Montserrat",
                    color: KConstants.baseRedColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: List.generate(
                KConstants.foodImages.length,
                (index) => Container(
                      height: 100.0,
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IntrinsicHeight(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 0, top: 10, bottom: 10, right: 10),
                                  child: Image(
                                    image: AssetImage(
                                        KConstants.foodImages[index]),
                                  ),
                                ),
                              ),
                              SizedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "June 19th ",
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                        color: KConstants.baseThreeDarkColor,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      KConstants.foodName[index],
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                        color: KConstants.baseRedColor,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/location.svg",
                                          width: 12,
                                          height: 12,
                                        ),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        Text(
                                          'Apo Resettlement, Abuja ',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'Montserrat'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "2000",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                color: KConstants.baseDarkColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                        ],
                      ),
                    )),
          )
        ]),
      ),
    ));
  }
}
