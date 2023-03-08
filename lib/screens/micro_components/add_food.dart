import 'package:chopwell_rider_application/constants/constants.dart';
import 'package:chopwell_rider_application/models/asset_models/product_model.dart';
import 'package:chopwell_rider_application/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddFoodBox extends ConsumerWidget {
  AddFoodBox(this.foodImage, this.foodName, this.searchPage,
      this.restaurantName, this.price, this.foodId, this.restaurantId);

  String foodImage;
  String foodName;
  bool searchPage;
  String restaurantName;
  String price;
  String foodId;
  String restaurantId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final cartBalance = ref.watch(cartStateNotifierProvider);
    return Container(
      width: screenWidth * 0.35,
      height: screenHeight * 0.35,
      padding: EdgeInsets.symmetric(vertical: 2.0),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: KConstants.baseShadowColor,
              offset: Offset(1.0, 1.0),
              blurRadius: 2.0,
              spreadRadius: 0.0,
            )
          ],
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      margin: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 1.0),
      child: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0),
              child: Container(
                width: screenWidth * 0.4,
                height: screenHeight * 0.15,
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      margin: const EdgeInsets.only(bottom: 5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.network(
                          foodImage,
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 2.0,
                      left: 30.0,
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: Color(0x40000000),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          "\₦$price",
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            SizedBox(
              width: 120.0,
              child: Text(
                foodName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            !searchPage
                ? Text(
                    this.restaurantName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: "Questrial",
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  )
                : Container(),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              width: screenWidth * 0.35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      ),
                      onPressed: () {
                        Product cartProduct = Product(
                            price: price,
                            name: foodName,
                            id: foodId,
                            image: foodImage,
                            restaurantId: restaurantId);
                        ref
                            .read(cartStateNotifierProvider.notifier)
                            .addProduct(cartProduct);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(milliseconds: 500),
                            content: Text(
                              'Added "$foodName" to Cart',
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
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 10.0,
                        ),
                        decoration: BoxDecoration(
                            color: KConstants.baseTwoRedColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0))),
                        child: const Text(
                          "ADD",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )),
                  IconButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                    ),
                    onPressed: () {
                      Product cartProduct = Product(
                          price: price,
                          name: foodName,
                          id: foodId,
                          image: foodImage,
                          restaurantId: restaurantId);
                      ref
                          .read(cartStateNotifierProvider.notifier)
                          .removeProduct(cartProduct);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(milliseconds: 500),
                          content: Text(
                            'Removed "$foodName" to Cart',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          backgroundColor: KConstants.baseRedColor,
                          shape: RoundedRectangleBorder(
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
                      width: 30,
                      height: 30,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
