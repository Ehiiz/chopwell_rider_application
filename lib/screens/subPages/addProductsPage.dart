import 'package:chopwell_rider_application/builders/subAppBar.dart';
import 'package:chopwell_rider_application/screens/micro_components/product_list.dart';
import 'package:flutter/material.dart';
import 'package:chopwell_rider_application/constants/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddProductsPage extends StatefulWidget {
  const AddProductsPage({Key? key}) : super(key: key);

  @override
  State<AddProductsPage> createState() => _AddProductsPageState();
}

class _AddProductsPageState extends State<AddProductsPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.01,
          horizontal: screenWidth * 0.02,
        ),
        child: SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: ListView(
            children: [
              SizedBox(
                width: screenWidth * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 30.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: KConstants.baseRedColor,
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "1",
                            style: TextStyle(
                                fontFamily: "Questrial",
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 35,
                      child: TextField(
                        //      controller: _bookTitleController,
                        maxLines: 1,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: "food name",
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
                      height: 35,
                      child: TextField(
                        //      controller: _bookTitleController,
                        maxLines: 1,
                        decoration: InputDecoration(
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
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 35,
                      child: TextField(
                        //      controller: _bookTitleController,
                        maxLines: 1,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: "image",
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
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: "categories",
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
                      height: 20,
                    ),
                    Text(
                      "select options",
                      style: TextStyle(
                          color: KConstants.baseDarkColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Montserrat"),
                    )
                  ],
                ),
              ),
              SizedBox(height: 50.0),
              Center(
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: null,
                    child: Text(
                      'upload products',
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
            ],
          ),
        ),
      ),
    );
  }
}
