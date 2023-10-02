// ignore_for_file: use_build_context_synchronously

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chopwell_rider_application/authentication/token-utils.dart';
import 'package:chopwell_rider_application/authentication/user-utils.dart';
import 'package:chopwell_rider_application/builders/subAppBar.dart';
import 'package:chopwell_rider_application/models/request_models/update_rider_status_request_model.dart';
import 'package:chopwell_rider_application/models/response_models/map_based_response_model.dart';
import 'package:chopwell_rider_application/models/request_models/set_location_request_model.dart';
import 'package:chopwell_rider_application/screens/Nav_Pages/ordersPage.dart';
import 'package:chopwell_rider_application/screens/micro_components/location_bar.dart';
import 'package:chopwell_rider_application/screens/micro_components/profile_buttons.dart';
import 'package:chopwell_rider_application/services/fetch_user_detail_service.dart';
import 'package:chopwell_rider_application/services/update_location_service.dart';
import 'package:chopwell_rider_application/constants/constants.dart';
import 'package:chopwell_rider_application/screens/subPages/bankWithdrawalDetailsPage.dart';
import 'package:chopwell_rider_application/screens/subPages/orderHistoryPage.dart';
import 'package:chopwell_rider_application/screens/subPages/payoutHistoryPage.dart';
import 'package:chopwell_rider_application/services/update_rider_status_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:shimmer/shimmer.dart';

import '../registration_page/loginPage.dart';




Future<Position> getCurrentLocation() async {
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
  bool _updateRIderProgress = false;

  late Future<Object?> _user;
  String location = "Search Location";

  double latitude = 0.0;
  double longitude = 0.0;

  void changeValue(double lat, double long, String addr) {
   
    setState(() {
      latitude = lat;
      longitude = long;
      location = addr;
    });
    _updateLocation(context, location, latitude, longitude);
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _user = UserInfo.getUserInfo();
    });
  }

  void _updateLocation(
    BuildContext context,
    String location,
    double latitude,
    double longitude,
  ) async {
    final request = SetLocationRequestModel(
      location: location,
      longitude: longitude,
      latitude: latitude,
    );
    final response = await UpdateLocationService.location(request);

    if (response.status == "success") {
      await UserInfo.setUserInfo(response.data);
      ScaffoldMessenger.of(context)
          .showSnackBar(customSuccessBar("Location Updated"));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(customErrorBar("Failed to update location"));
    }
  }

  void _updateRiderStatus(BuildContext context, String status) async {
    setState(() {
      _updateRIderProgress = true;
    });
    final request = UpdateRiderStatusRequestModel(rider_status: status);
    final response = await UpdateRiderService().flipStatus(request);

    if (response.status == "success") {
      setState(() {
        _updateRIderProgress = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(customSuccessBar("Status updated"));

      ref.refresh(fetchUserDetailFutureProvider);
    } else {
      setState(() {
        _updateRIderProgress = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(customErrorBar("Failed to update status"));

      ref.refresh(fetchUserDetailFutureProvider);
    }
  }

      bool riderStatus = false;
    String requestStatus = "";


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final userDetailRef = ref.watch(fetchUserDetailFutureProvider);


    return MaterialApp(
      home: FutureBuilder(
          future: _user,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (snapshot.data != null) {
              final userDetail = snapshot.data as Map<String, dynamic>;
              return SafeArea(
                child: Scaffold(
                  extendBody: true,
                  appBar: buildNavAppBar(context, "Profile", screenWidth),
                  body: Center(
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.01,
                            horizontal: screenWidth * 0.02,
                          ),
                          child: Stack(children: [
                            ListView(
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 50,
                                        backgroundImage: NetworkImage(
                                            userDetail?["profile_picture"]),
                                        backgroundColor:
                                            KConstants.baseGreenColor,
                                      ),

                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        userDetail["name"].toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: KConstants.baseTwoDarkColor,
                                          fontSize: 18,
                                          fontFamily: 'Montserrat',
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),

                                      // ignore: prefer_const_constructors
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                LocationBar(
                                                    address:
                                                        userDetail["location"]
                                                            ["address"],
                                                    onLocationChanged:
                                                        changeValue,
                                                    accountSetup: false),
                                              ])
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // ignore: prefer_const_constructors
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 5.0),
                                            child:  Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                IconButton(
                                                    onPressed: null,
                                                    icon: Icon(
                                                        CupertinoIcons.hand_draw_fill,
                                                        color: KConstants.baseDarkColor,
                                                        ),),
                                              const  SizedBox(
                                                  width: 10,
                                                ),
                                             const   Text(
                                                  "change status",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Montserrat',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          userDetailRef.when(data: (data) {
                                            final status = data.data["status"];

                                            
                                            return Column(children: [
                                              Switch(
                                                value: status == "online" ? true : false,
                                                onChanged: (value) {
                                                  _updateRiderStatus(
                                                      context, status == "online" ? "offline" : "online");
                                                ref.refresh(fetchUserDetailFutureProvider);
                                                }),
                                                Text(status, style: const TextStyle(fontFamily: "Montserrat", fontSize: 12.00),)

                                            ],) ;
                                          }, error: (error, _) {
                                            return const Text("error update status");
                                          }, loading: () {
                                            return Shimmer.fromColors(
                                              baseColor:
                                                  KConstants.baseFiveGreyColor,
                                              highlightColor:
                                                  KConstants.baseFiveGreyColor,
                                              child: Container(
                                                color: Colors.white,
                                                height: 10,
                                                width: 10,
                                              ),
                                            );
                                          })
                                        ]),
                                    ProfileButtons(
                                        "assets/coupon.svg",
                                        "Payment Details",
                                        const BankWithdrawalDetailsPage()),
                                    ProfileButtons("assets/helmet.svg",
                                        "Delivery History", const OrderHistoryPage()),
                                    ProfileButtons("assets/withdrawal.svg",
                                        "Payout History", const PayoutHistoryPage()),
                                    ProfileButtons(
                                        "assets/help.svg", "Help", const MyOrders()),
                                    TextButton(
                                      onPressed: () async {
                                        await AuthToken.clearAuthToken();
                                        pushNewScreen(
                                          context,
                                          screen: const LoginPage(),
                                          withNavBar:
                                              false, // OPTIONAL VALUE. True by default.
                                          pageTransitionAnimation:
                                              PageTransitionAnimation.cupertino,
                                        );
                                      },
                                      child: Text(
                                        "Logout",
                                        style: TextStyle(
                                            color: KConstants.baseRedColor,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Montserrat"),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            if (_updateRIderProgress)
                              const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.red,
                                ),
                              ),
                          ]))),
                ),
              );
            } else {
              WidgetsBinding.instance?.addPostFrameCallback((_) {
                // Navigate to login page without the navigation bar
                pushNewScreen(
                  context,
                  screen: const LoginPage(),
                  withNavBar: false, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              });
              return Container(); // R
            }
          }),
    );
  }
}
