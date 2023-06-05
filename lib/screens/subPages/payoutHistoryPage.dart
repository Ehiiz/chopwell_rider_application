import 'package:chopwell_rider_application/models/response_models/list_based_response_model.dart';
import 'package:flutter/material.dart';
import 'package:chopwell_rider_application/constants/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../services/payout_history_service.dart';

final payoutHistoryFutureProvider =
    FutureProvider.autoDispose<ListDataResponseModel>((ref) {
  final payoutHistoryService = ref.watch(payoutHistoryServiceProvider);
  return payoutHistoryService.fetchPayouts();
});

class PayoutHistoryPage extends ConsumerWidget {
  const PayoutHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final payoutsRef = ref.watch(payoutHistoryFutureProvider);
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
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 25,
          ),
        ),
        actions: const [
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
          const SizedBox(height: 10),
          Column(
              children: payoutsRef.when(data: (data) {
            List<dynamic> payouts = data.data;
            return payouts.isEmpty
                ? [
                    Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: screenHeight * .2,
                            ),
                            SvgPicture.asset(
                              "assets/Burger.svg",
                              width: 100,
                              height: 100,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("No completed orders... yettt",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                )),
                          ]),
                    )
                  ]
                : List.generate(
                    data.data.length,
                    (index) => Container(
                          margin: const EdgeInsets.only(bottom: 10.0),
                          height: 100.0,
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(
                                width: screenWidth * 0.2,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      payouts[index]["created"],
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 13.0,
                                        color: KConstants.baseDarkColor,
                                      ),
                                    ),
                                    Text(
                                      "",
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 13.0,
                                        color: KConstants.baseDarkColor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          payouts[index]["paid_to"]["bankName"],
                                          style: TextStyle(
                                            fontFamily: "Montserrat",
                                            color: KConstants.baseRedColor,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          payouts[index]["paid_to"]
                                              ["accountName"],
                                          style: TextStyle(
                                            fontFamily: "Montserrat",
                                            color: KConstants.baseDarkColor,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                        Text(
                                          payouts[index]["paid_to"]
                                              ["accountNumber"],
                                          style: TextStyle(
                                            fontFamily: "Montserrat",
                                            color: KConstants.baseDarkColor,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "₦${payouts[index]["paid_to"]["amount"]}",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      color: KConstants.baseDarkColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Divider(
                                color: KConstants.baseGreyColor,
                                thickness: 1,
                                height: 10,
                              )
                            ],
                          ),
                        ));
          }, error: (error, _) {
            return [Text(error.toString())];
          }, loading: () {
            return [
              Shimmer.fromColors(
                baseColor: KConstants.baseFourGreyColor,
                highlightColor: KConstants.baseFourGreyColor,
                child: Container(
                    color: Colors.white,
                    height: screenHeight * .7,
                    width: screenWidth),
              )
            ];
          }))
        ]),
      ),
    ));
  }
}
