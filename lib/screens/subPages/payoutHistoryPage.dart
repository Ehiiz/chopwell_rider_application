import 'package:flutter/material.dart';
import 'package:chopwell_rider_application/constants/constants.dart';

class PayoutHistoryPage extends StatelessWidget {
  const PayoutHistoryPage({Key? key}) : super(key: key);

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
          Text('Payout History',
              style: Theme.of(context).primaryTextTheme.titleLarge),
          SizedBox(height: 10),
          Column(
            children: List.generate(
                KConstants.foodImages.length,
                (index) => Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      height: 100.0,
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            width: screenWidth * 0.2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "June 19th",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 13.0,
                                    color: KConstants.baseDarkColor,
                                  ),
                                ),
                                Text(
                                  "19:30",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 13.0,
                                    color: KConstants.baseDarkColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "GT Bank",
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                        color: KConstants.baseRedColor,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "Oriasotie Emmanuel Ehimare",
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                        color: KConstants.baseDarkColor,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "098082672882",
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                        color: KConstants.baseDarkColor,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
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
                          SizedBox(
                            height: 5,
                          ),
                          Divider(
                            color: KConstants.baseGreyColor,
                            thickness: 1,
                            height: 10,
                          )
                        ],
                      ),
                    )),
          )
        ]),
      ),
    ));
  }
}
