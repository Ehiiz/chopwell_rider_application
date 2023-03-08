import 'package:chopwell_rider_application/models/response_models/map_based_response_model.dart';
import 'package:chopwell_rider_application/models/request_models/set_location_request_model.dart';
import 'package:chopwell_rider_application/screens/Nav_Pages/ordersPage.dart';
import 'package:chopwell_rider_application/screens/micro_components/profile_buttons.dart';
import 'package:chopwell_rider_application/screens/registration_page/confirmEmailPage.dart';
import 'package:chopwell_rider_application/services/fetch_user_detail_service.dart';
import 'package:chopwell_rider_application/services/third_party_services/google_location_service.dart';
import 'package:chopwell_rider_application/services/update_location_service.dart';
import 'package:chopwell_rider_application/constants/constants.dart';
import 'package:chopwell_rider_application/models/request_models/set_location_request_model.dart';
import 'package:chopwell_rider_application/models/response_models/map_based_response_model.dart';
import 'package:chopwell_rider_application/screens/micro_components/profile_buttons.dart';
import 'package:chopwell_rider_application/services/update_location_service.dart';
import 'package:chopwell_rider_application/screens/subPages/bankWithdrawalDetailsPage.dart';
import 'package:chopwell_rider_application/screens/subPages/orderHistoryPage.dart';
import 'package:chopwell_rider_application/screens/subPages/payoutHistoryPage.dart';
import 'package:flutter/material.dart';
import 'package:chopwell_rider_application/constants/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shimmer/shimmer.dart';

import '../../services/fetch_user_detail_service.dart';
import '../registration_page/loginPage.dart';

final fetchUserDetailFutureProvider =
    FutureProvider<MapDataResponseModel>((ref) async {
  final fetchUserDetailService = ref.watch(fetchUserDetailProvider);

  return fetchUserDetailService.info();
});

class NewProfilePage extends ConsumerStatefulWidget {
  const NewProfilePage({Key? key}) : super(key: key);

  @override
  ConsumerState<NewProfilePage> createState() => _NewProfilePageState();
}

class _NewProfilePageState extends ConsumerState<NewProfilePage> {
  void _updateLocation() async {
    final request = SetLocationRequestModel(location: "location");
    final response = await UpdateLocationService.location(request);

    if (response.status == "success") {
      // Navigator.push(context, MaterialPageRoute(builder: (context) {
      //   return MainNavPage();
      // }));
    } else {
      print(response);
      customErrorBar("Unable to update location");
    }
  }

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are denied forever');
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final userDetailRef = ref.watch(fetchUserDetailFutureProvider);
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          actions: [
            Container(
              width: screenWidth,
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Profile',
                      style: Theme.of(context).primaryTextTheme.titleLarge,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/notification-svgrepo-com.svg",
                      color: KConstants.baseTwoDarkColor,
                      width: 35.0,
                      height: 35.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.01,
              horizontal: screenWidth * 0.02,
            ),
            child: ListView(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      userDetailRef.when(data: (data) {
                        final userDetail = data.data;
                        return CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              NetworkImage(userDetail["profile_picture"]),
                          // backgroundColor: KConstants.baseGreenColor,
                        );
                      }, error: (error, _) {
                        return Text(error.toString());
                      }, loading: () {
                        return Shimmer.fromColors(
                          baseColor: KConstants.baseFourGreyColor,
                          highlightColor: KConstants.baseFourDarkColor,
                          child: Container(
                            width: 10.0,
                            height: 10.0,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                        );
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                      userDetailRef.when(data: (data) {
                        final userDetail = data.data;
                        return Text(
                          userDetail["name"].toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: KConstants.baseTwoDarkColor,
                            fontSize: 18,
                            fontFamily: 'Montserrat',
                          ),
                        );
                      }, error: (error, _) {
                        return Text(error.toString());
                      }, loading: () {
                        return Shimmer.fromColors(
                            child: Container(
                                height: 10,
                                width: 150,
                                margin: EdgeInsets.symmetric(vertical: 5.0),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0)))),
                            baseColor: KConstants.baseFourGreyColor,
                            highlightColor: KConstants.baseFourDarkColor);
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/location.svg",
                            width: 25,
                            height: 25,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          userDetailRef.when(data: (data) {
                            final userDetail = data.data;
                            return Text(
                              userDetail["location"]["address"],
                              style: const TextStyle(
                                fontSize: 17,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.normal,
                              ),
                            );
                          }, error: (error, _) {
                            return Text(error.toString());
                          }, loading: () {
                            return Shimmer.fromColors(
                                child: Container(
                                    height: 10,
                                    width: 150,
                                    margin: EdgeInsets.symmetric(vertical: 5.0),
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)))),
                                baseColor: KConstants.baseFourGreyColor,
                                highlightColor: KConstants.baseFourDarkColor);
                          }),
                        ],
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'edit',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                            color: KConstants.baseGreenColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    ProfileButtons("assets/card.svg", "Rider Details",
                        BankWithdrawalDetailsPage()),
                    ProfileButtons("assets/coupon.svg", "Payment Details",
                        BankWithdrawalDetailsPage()),
                    ProfileButtons("assets/order_history.svg",
                        "Delivery History", OrderHistoryPage()),
                    ProfileButtons("assets/order_history.svg", "Payout History",
                        PayoutHistoryPage()),
                    ProfileButtons("assets/help.svg", "Help", MyOrders())
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
