// ignore_for_file: use_build_context_synchronously
import 'dart:io';

import 'package:chopwell_rider_application/constants/constants.dart';
import 'package:chopwell_rider_application/models/request_models/bvn_enquiry_request_model.dart';
import 'package:chopwell_rider_application/models/request_models/complete_account_request_model.dart';
import 'package:chopwell_rider_application/screens/bottom_sheets/updateLocationCard.dart';
import 'package:chopwell_rider_application/screens/micro_components/signin_input.dart';
import 'package:chopwell_rider_application/screens/registration_page/loginPage.dart';
import 'package:chopwell_rider_application/services/complete_account_service.dart';
import 'package:chopwell_rider_application/services/fetch_bank_list_service.dart';
import 'package:chopwell_rider_application/utils/image_kit.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/widgets.dart';

import '../../../main.dart';
import '../../../services/third_party_services/google_location_service.dart';

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
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _bvnController = TextEditingController();

  bool _showProgressIndicator = false;
  bool _showLocationIndicator = false;
  bool _imageSet = false;
  double latitude = 0.0;
  double longitude = 0.0;

  bool _isButtonDisabled = true;

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(_validateInput);
    _stateController.addListener(_validateInput);
    _nameController.addListener(_validateInput);
    _locationController.addListener(_validateInput);
    _bvnController.addListener(_fetchUserDetails);
    _bvnController.addListener(_validateInput);
  }

  Future<File?> _getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File file = File(pickedFile.path);
      final image = await imageUpload(file);
      print(image);
      setState(() {
        // imageStatus = "image uploaded";
        _imageController.text = image;
        _imageSet = true;
      });
    }
  }

  void changeValue(double lat, double long, String addr) {
    setState(() {
      latitude = lat;
      longitude = long;
      _locationController.text = addr;
    });
  }

  bool submitForm = false;
  void _hanldeCompleteAccount(
      BuildContext context, double longitude, double latitude) async {
    final name = _nameController.text;
    final state = _stateController.text;
    final location = _locationController.text;
    final phone = _phoneController.text;
    final image = _imageController.text;
    final bvn = _bvnController.text;

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
      profile_picture: image,
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

  void _validateInput() {
    final phoneValid = phoneRegex.hasMatch(_phoneController.text);
    final stateValid = nameRegex.hasMatch(_stateController.text);
    final locationValid = nameRegex.hasMatch(_locationController.text);
    final nameValid = nameRegex.hasMatch(_nameController.text);
    final bvnValid = bvnRegex.hasMatch(_bvnController.text);
    setState(() {
      _isButtonDisabled =
          !(phoneValid && stateValid && locationValid && nameValid && bvnValid);
    });
  }

  void _fetchUserDetails() async {
    if (_bvnController.text.length == 11) {
      setState(() {
        _showLocationIndicator = true;
      });
      final request = BvnEnquiryRequestModel(bvn: _bvnController.text);

      final response = await BankEnquiryService().bvnEnquiry(request);
      if (response.status == "success") {
        // include toast notification

        final firstName = response.data["firstName"];
        final middleName = response.data["middleName"];
        final lastName = response.data["lastName"];

        setState(() {
          _nameController.text = "$firstName $middleName $lastName";
          _showLocationIndicator = false;
        });

        ScaffoldMessenger.of(context)
            .showSnackBar(customSuccessBar("Name Verified"));
      } else {
        setState(() {
          _showLocationIndicator = false;
        });
        ScaffoldMessenger.of(context)
            .showSnackBar(customErrorBar("Failed to Verify Name"));
      }
    } else {
      print("I nor work");
    }
  }

  @override
  void dispose() {
    _locationController.dispose();
    _stateController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _bvnController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
            child: Stack(
          children: [
            ListView(
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
                SizedBox(
                  width: width * .8,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => _getImage(),
                          child: _imageSet
                              ? CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                      AssetImage("assets/OIP.jpeg"))
                              : CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                      NetworkImage(_imageController.text),
                                ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * .05),
                          child: SignInput(
                            Icons.code,
                            "bvn",
                            "invalid BVN Details",
                            "enter your BVN",
                            true,
                            regExp: bvnRegex,
                            controller: _bvnController,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * .05),
                          child: SignInput(
                            Icons.person,
                            "name",
                            "full name",
                            "",
                            false,
                            regExp: nameRegex,
                            controller: _nameController,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * .05),
                          child: SignInput(
                            Icons.phone_android_rounded,
                            "phone",
                            "must be a valid phone number",
                            "",
                            true,
                            regExp: phoneRegex,
                            controller: _phoneController,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * .05),
                          child: SignInput(
                            Icons.location_city_rounded,
                            "state",
                            "incorrect state",
                            "Abuja",
                            true,
                            regExp: nameRegex,
                            controller: _stateController,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * .05),
                          child: SignInput(
                            Icons.my_location_outlined,
                            "address",
                            "invalid location",
                            "Abuja",
                            false,
                            regExp: nameRegex,
                            controller: _locationController,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Colors.transparent,
                              ),
                            ),
                            onPressed: () async {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (BuildContext context) {
                                  return StatefulBuilder(
                                    builder: (BuildContext context,
                                        StateSetter setState) {
                                      return SetLocationCard(
                                        onLocationChanged: changeValue,
                                        accountSetup: true,
                                      );
                                    },
                                  );
                                },
                              );
                            },
                            // ignore: prefer_const_constructors
                            child: Text(
                              'set address',
                              style: TextStyle(
                                fontFamily: "Questrial",
                                color: KConstants.baseDarkColor,
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
                                  onPressed: _isButtonDisabled
                                      ? null
                                      : () => _hanldeCompleteAccount(
                                            context,
                                            longitude,
                                            latitude,
                                          ),
                                  style: ButtonStyle(
                                    backgroundColor: _isButtonDisabled
                                        ? MaterialStateProperty.all(
                                            KConstants.baseThreeGreyColor)
                                        : MaterialStateProperty.all(
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
                              Positioned.fill(
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: KConstants.baseRedColor,
                                    backgroundColor: Colors.transparent,
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
            if (_showLocationIndicator)
              Positioned.fill(
                child: Center(
                  child: CircularProgressIndicator(
                    color: KConstants.baseRedColor,
                  ),
                ),
              ),
          ],
        )),
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
