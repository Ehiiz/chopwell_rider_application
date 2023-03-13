import 'package:chopwell_rider_application/screens/bottom_sheets/foodOptionsCard.dart';
import 'package:chopwell_rider_application/constants/constants.dart';
import 'package:chopwell_rider_application/models/asset_models/product_model.dart';
import 'package:chopwell_rider_application/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:sliding_sheet/sliding_sheet.dart';

class ProductBar extends ConsumerWidget {
  ProductBar(this.options, this.price, this.mealName, this.mealPicture,
      this.foodId, this.restaurantId, this.quantity);

  bool options;
  String price;
  String mealName;
  String mealPicture;
  String foodId;
  String restaurantId;
  String? quantity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final cartBalance = ref.watch(cartStateNotifierProvider);

    return Container(
      height: 100.0,
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.network(
              mealPicture,
              width: screenWidth * 0.15,
              height: screenHeight * 0.08,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: screenWidth * 0.35,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  mealName,
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    color: KConstants.baseDarkColor,
                    fontSize: 17.0,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  "\₦$price",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    color: KConstants.baseDarkColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                // options
                //     ? GestureDetector(
                //         // onTap: () {
                //         //   showSlidingBottomSheet(
                //         //     context,
                //         //     builder: (context) => SlidingSheetDialog(
                //         //         cornerRadius: 10.0,
                //         //         snapSpec: const SnapSpec(
                //         //           initialSnap: 0.7,
                //         //           snappings: [0.4, 0.7, 0.8],
                //         //         ),
                //         //         builder: buildSheet,
                //         //         headerBuilder: buildHeader),
                //         //   );
                //         // },
                //         child: Text(
                //           "select options",
                //           style: TextStyle(
                //             fontFamily: "Montserrat",
                //             fontSize: 15.0,
                //             fontWeight: FontWeight.bold,
                //             color: KConstants.baseRedColor,
                //           ),
                //         ),
                //       )
                //     : Container(),
              ],
            ),
          ),
          SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  quantity ?? "1",
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
                        onPressed: () {
                          Product cartProduct = Product(
                              price: price,
                              name: mealName,
                              id: foodId,
                              image: mealPicture,
                              restaurantId: restaurantId);
                          ref
                              .read(cartStateNotifierProvider.notifier)
                              .addProduct(cartProduct);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: Duration(milliseconds: 100),
                              content: Text(
                                'Added "$mealName" to Cart',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              backgroundColor: KConstants.baseGreenColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(16.0),
                                ),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 35,
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 10.0),
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
                      onPressed: () {
                        Product cartProduct = Product(
                            price: price,
                            name: mealName,
                            id: foodId,
                            image: mealPicture,
                            restaurantId: restaurantId);
                        ref
                            .read(cartStateNotifierProvider.notifier)
                            .removeProduct(cartProduct);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(milliseconds: 100),
                            content: Text(
                              'Removed "$mealName" to Cart',
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            backgroundColor: KConstants.baseTwoRedColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.0),
                                topRight: Radius.circular(16.0),
                              ),
                            ),
                          ),
                        );
                      },
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
          ),
          Divider(
            color: Colors.black,
          )
        ],
      ),
    );
  }

  Widget buildSheet(context, state) => FoodOptionsCard();
  // Widget buildHeader(BuildContext context, SheetState state) => Material(
  //       child: Container(
  //         color: KConstants.baseTwoDarkColor,
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: <Widget>[
  //             SizedBox(
  //               height: 10.0,
  //             ),
  //             Center(
  //               child: Container(
  //                 width: 48,
  //                 height: 8,
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(20),
  //                   color: Colors.white,
  //                 ),
  //               ),
  //             ),
  //             SizedBox(
  //               height: 10.0,
  //             )
  //           ],
  //         ),
  //       ),
  //     );
}
