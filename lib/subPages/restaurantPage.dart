import 'package:chopwell_merchant_application/components/product_list.dart';
import 'package:chopwell_merchant_application/subPages/addProductsPage.dart';
import 'package:flutter/material.dart';
import 'package:chopwell_merchant_application/constants/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    bool _editMode = true;
    bool editMode;

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
                )),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AddProductsPage();
                    }));
                  },
                  child: Text(
                    "add products",
                    style: TextStyle(
                      color: KConstants.baseRedColor,
                      fontSize: 15.0,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ]),
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.01,
            horizontal: screenWidth * 0.02,
          ),
          child: SizedBox(
            width: screenWidth,
            height: screenHeight,
            child: Column(
              children: [
                SizedBox(
                  width: screenWidth * 0.9,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: Image(
                              image: AssetImage('images/Res-2.png'),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dominos Pizza",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset("assets/location.svg"),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    "Ugbowo, Benin City",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey,
                                        fontFamily: "Questrial"),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset("assets/delivery_bike.svg"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "12 mins",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: KConstants.baseDarkColor,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _editMode = !_editMode;
                          print(_editMode);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              KConstants.baseOrangeColor),
                          elevation: MaterialStatePropertyAll(0.0),
                        ),
                        child: Text(
                          "edit",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                            fontFamily: "Questrial",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Expanded(
                  child: ListView.builder(
                      itemCount: 6,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              width: 80,
                              height: 40,
                              child: Center(
                                child: Text(
                                  'Pastries',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      }),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    flex: 8,
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.grey,
                      ),
                      itemCount: KConstants.foodImages.length,
                      itemBuilder: (context, index) {
                        return ProductBar(
                          true,
                          "\$500",
                          KConstants.foodName[index],
                          KConstants.foodImages[index],
                          true,
                        );
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
