import 'package:flutter/material.dart';
import 'package:chopwell_merchant_application/constants/constants.dart';
import 'package:chopwell_merchant_application/subPages/changePaymentDetailsPage.dart';

class BankWithdrawalDetailsPage extends StatelessWidget {
  const BankWithdrawalDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

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
              vertical: screenHeight * 0.01,
              horizontal: screenWidth * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Bank Payment Details',
                  style: Theme.of(context).primaryTextTheme.titleLarge,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "GT Bank",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 20.0,
                        color: KConstants.baseDarkColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Oriasotie Emmanuel",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 20.0,
                        color: KConstants.baseGreyColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "0116780789",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 20.0,
                        color: KConstants.baseGreyColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(
                      thickness: 2.0,
                      color: KConstants.baseFourGreyColor,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.transparent),
                          elevation: MaterialStatePropertyAll(0.0),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ChangePaymentDetailsPage();
                          }));
                        },
                        child: Text(
                          "change bank details",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 15.0,
                            color: KConstants.baseRedColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Center(
                    child: SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: null,
                        child: Text(
                          'Withdraw Details',
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              KConstants.baseTwoRedColor,
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
