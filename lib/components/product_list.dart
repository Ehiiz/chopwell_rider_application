import 'package:chopwell_merchant_application/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:chopwell_merchant_application/bottom_sheets/foodOptionsCard.dart';

class ProductBar extends StatelessWidget {
  ProductBar(
    this.options,
    this.price,
    this.mealName,
    this.mealPicture,
    this.merchantType,
  );

  bool options;
  String price;
  String mealName;
  String mealPicture;
  bool merchantType;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    bool editMode = true;

    return Container(
      height: 100.0,
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 0.0, right: 20, bottom: 5, top: 5),
            child: Image(
              image: AssetImage(mealPicture),
            ),
          ),
          SizedBox(
            width: screenWidth * 0.35,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                !editMode
                    ? Text(
                        mealName,
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          color: KConstants.baseThreeDarkColor,
                          fontSize: 15.0,
                        ),
                      )
                    : SizedBox(
                        height: 25,
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
                            labelText: "food",
                            labelStyle: TextStyle(
                              color: KConstants.baseTwoGreyColor,
                              fontSize: 15,
                              height: 1,
                              fontFamily: "Montserrat",
                            ),
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 10.0,
                ),
                !editMode
                    ? Text(
                        price,
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            color: KConstants.baseDarkColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      )
                    : SizedBox(
                        height: 25,
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
                            labelText: "price",
                            labelStyle: TextStyle(
                              color: KConstants.baseTwoGreyColor,
                              fontSize: 15,
                              height: 1,
                              fontFamily: "Montserrat",
                            ),
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 10.0,
                ),
                options
                    ? GestureDetector(
                        onTap: () {
                          showSlidingBottomSheet(
                            context,
                            builder: (context) => SlidingSheetDialog(
                                cornerRadius: 10.0,
                                snapSpec: SnapSpec(
                                  initialSnap: 0.7,
                                  snappings: [0.4, 0.7, 0.8],
                                ),
                                builder: buildSheet,
                                headerBuilder: buildHeader),
                          );
                        },
                        child: Text(
                          "select options",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: KConstants.baseRedColor,
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          !merchantType
              ? SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "-",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            color: KConstants.baseGreyColor,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
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
              : Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: editMode
                            ? MaterialStatePropertyAll(KConstants.baseDarkColor)
                            : MaterialStatePropertyAll(
                                KConstants.baseFourGreyColor),
                        elevation: MaterialStatePropertyAll(0.0),
                      ),
                      child: Text(
                        "delete",
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                          fontFamily: "Questrial",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: editMode
                            ? MaterialStatePropertyAll(KConstants.baseDarkColor)
                            : MaterialStatePropertyAll(
                                KConstants.baseFourGreyColor),
                        elevation: MaterialStatePropertyAll(0.0),
                      ),
                      child: Text(
                        editMode ? "save" : "edit",
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                          fontFamily: "Questrial",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
          Divider(
            color: Colors.black,
          )
        ],
      ),
    );
  }

  Widget buildSheet(context, state) => FoodOptionsCard();
  Widget buildHeader(BuildContext context, SheetState state) => Material(
        child: Container(
          color: KConstants.baseTwoDarkColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Center(
                child: Container(
                  width: 48,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              )
            ],
          ),
        ),
      );
}
