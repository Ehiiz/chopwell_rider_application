import 'package:chopwell_merchant_application/components/signin_input.dart';
import 'package:chopwell_merchant_application/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChangePaymentDetailsPage extends StatelessWidget {
  const ChangePaymentDetailsPage({Key? key}) : super(key: key);

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
                  'Update Payment Details',
                  style: Theme.of(context).primaryTextTheme.titleLarge,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 35,
                      child: TextField(
                        //      controller: _bookTitleController,
                        maxLines: 1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              // borderSide: BorderSide(
                              //   color: KConstants.baseRedColor,
                              // ),
                              borderSide: BorderSide.none),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: KConstants.baseRedColor,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: KConstants.baseRedColor,
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: "name of bank",
                          labelStyle: TextStyle(
                            color: KConstants.baseTwoGreyColor,
                            fontSize: 15,
                            height: 1,
                            fontFamily: "Montserrat",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 35,
                      child: TextField(
                        //      controller: _bookTitleController,

                        maxLines: 1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              // borderSide: BorderSide(
                              //   color: KConstants.baseRedColor,
                              // ),
                              borderSide: BorderSide.none),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: KConstants.baseRedColor,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: KConstants.baseRedColor,
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: "account number",
                          labelStyle: TextStyle(
                            color: KConstants.baseTwoGreyColor,
                            fontSize: 15,
                            height: 1,
                            fontFamily: "Montserrat",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 35,
                      child: TextField(
                        //      controller: _bookTitleController,
                        maxLines: 1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              // borderSide: BorderSide(
                              //   color: KConstants.baseRedColor,
                              // ),
                              borderSide: BorderSide.none),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: KConstants.baseRedColor,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: KConstants.baseRedColor,
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: "bank",
                          labelStyle: TextStyle(
                            color: KConstants.baseTwoGreyColor,
                            fontSize: 15,
                            height: 1,
                            fontFamily: "Montserrat",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: null,
                      child: Text(
                        'Update Bank Details',
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
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                )
              ],
            ),
          )),
    );
  }
}
