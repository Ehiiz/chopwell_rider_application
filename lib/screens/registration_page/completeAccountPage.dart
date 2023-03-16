// ignore_for_file: use_build_context_synchronously
import 'package:chopwell_rider_application/constants/constants.dart';
import 'package:chopwell_rider_application/models/request_models/complete_account_request_model.dart';
import 'package:chopwell_rider_application/screens/micro_components/signin_input.dart';
import 'package:chopwell_rider_application/screens/registration_page/loginPage.dart';
import 'package:chopwell_rider_application/services/complete_account_service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../../main.dart';
import '../../services/third_party_services/google_location_service.dart';

class CompleteAccountPage extends StatefulWidget {
  const CompleteAccountPage({Key? key}) : super(key: key);

  @override
  State<CompleteAccountPage> createState() => _CompleteAccountPageState();
}

class _CompleteAccountPageState extends State<CompleteAccountPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  TextEditingController _searchController = TextEditingController();

  bool _showProgressIndicator = false;
  double latitude = 0.0;
  double longitude = 0.0;

  bool submitForm = false;
  void _hanldeCompleteAccount(
      BuildContext context, double longitude, double latitude) async {
    final name = _nameController.text;
    final state = _stateController.text;
    final location = _locationController.text;
    final phone = _phoneController.text;

    setState(() {
      _showProgressIndicator = true;
    });

    final request = CompleteAccountRequestModel(
      name: name,
      address: location,
      state: state,
      phone: phone,
      longitude: longitude,
      latitude: latitude,
    );
    final response = await CompleteAccountService.setup(request);

    if (response.status == "success") {
      // include toast notification

      setState(() {
        _showProgressIndicator = false;
      });

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return BottomNavBar();
      }));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(customErrorBar("Account setup failed"));
    }
    // Do something with the email and password values
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
  void dispose() {
    _locationController.dispose();
    _stateController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          child: ListView(
            children: [
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  height: height * .3,
                  width: width * .2,
                  decoration: BoxDecoration(
                    color: KConstants.baseRedColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: width * .8,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * .05),
                        child: SignInput(
                          Icons.person,
                          "name",
                          "",
                          controller: _nameController,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * .05),
                        child: SignInput(
                          Icons.phone_android_rounded,
                          "phone",
                          "",
                          controller: _phoneController,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * .05),
                        child: SignInput(
                          Icons.map_rounded,
                          "state",
                          "",
                          controller: _stateController,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * .05),
                        child: SignInput(
                          Icons.location_city,
                          "location",
                          "",
                          controller: _locationController,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * .05),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            color: KConstants.baseFourRedColor,
                          ),
                          child: TextField(
                            onChanged: (value) {
                              print(value);
                            },
                            style: const TextStyle(
                              fontFamily: "Questrial",
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                            controller: _searchController,
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              fillColor: KConstants.baseRedColor,
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100.0),
                                ),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              prefixIcon: IconButton(
                                  onPressed: () {
                                    LocationService.getPlace(
                                        _searchController.text);
                                  },
                                  icon: Icon(
                                    Icons.my_location_rounded,
                                    color: KConstants.baseTwoRedColor,
                                  )),
                              labelStyle: TextStyle(
                                fontFamily: "Montserrat",
                                color: KConstants.baseRedColor,
                                fontSize: 15.0,
                                // fontWeight: FontWeight.bold,
                              ),
                              labelText: "address",
                              hintText: "",
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Colors.white,
                            ),
                          ),
                          onPressed: () async {
                            Position? location = await _getCurrentLocation();
                            print(location);
                            setState(() {
                              latitude = location!.latitude;
                              longitude = location!.longitude;
                            });
                          },
                          child: Text(
                            'use current location',
                            style: TextStyle(
                              fontFamily: "Questrial",
                              color: Colors.red,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                      Stack(
                        children: [
                          SizedBox(
                            width: 200,
                            height: 48,
                            child: OutlinedButton(
                                onPressed: () => _hanldeCompleteAccount(
                                      context,
                                      longitude,
                                      latitude,
                                    ),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      KConstants.baseDarkColor),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  )),
                                ),
                                child: Text(
                                  _showProgressIndicator
                                      ? ''
                                      : "complete setup",
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ),
                          if (_showProgressIndicator)
                            const Positioned.fill(
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ]),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 30);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
