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
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../../main.dart';
import '../../../services/third_party_services/google_location_service.dart';

class CompleteAccountPage extends StatefulWidget {
  CompleteAccountPage({Key? key, required this.phoneNumber}) : super(key: key);

  final String phoneNumber;

  @override
  State<CompleteAccountPage> createState() => _CompleteAccountPageState();
}

class _CompleteAccountPageState extends State<CompleteAccountPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _bvnController = TextEditingController();

  bool _showProgressIndicator = false;
  bool _showLocationIndicator = false;
  bool _imageSet = false;
  double latitude = 0.0;
  double longitude = 0.0;
  String dateOfBirth = "";
  String _selectedItem = "Edo";
  bool detailsMatch = false;
  String bvnName = "";

  bool _isButtonDisabled = true;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateInput);
    _stateController.addListener(_validateInput);
    _nameController.addListener(_validateInput);
    _firstNameController.addListener(_validateInput);
    _lastNameController.addListener(_validateInput);
    _middleNameController.addListener(_validateInput);
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
    final email = _emailController.text;
    final image = _imageController.text;
    final bvn = _bvnController.text;
    String phone = "+234" + widget.phoneNumber.substring(1);

    setState(() {
      _showProgressIndicator = true;
    });

    if (bvnName.toLowerCase() != name.toLowerCase()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(customErrorBar("BVN details does not match"));
      _bvnController.clear();
      return;
    }

    final request = CompleteAccountRequestModel(
      name: name,
      address: location,
      state: state,
      phone: phone,
      longitude: longitude,
      latitude: latitude,
      profile_picture: image,
      bvn: bvn,
      dateOfBirth: dateOfBirth,
      email: email,
    );
    final response = await CompleteAccountService.setup(request);

    if (response.status == "success") {
      // include toast notification

      setState(() {
        _showProgressIndicator = false;
      });
      pushNewScreen(
        context,
        screen: BottomNavBar(),
        withNavBar: false, // OPTIONAL VALUE. True by default.
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
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
    final emailValid = emailRegExp.hasMatch(_emailController.text);
    final stateValid = nameRegex.hasMatch(_stateController.text);
    final locationValid = nameRegex.hasMatch(_locationController.text);
    final nameValid = nameRegex.hasMatch(_nameController.text);
    final bvnValid = bvnRegex.hasMatch(_bvnController.text);
    setState(() {
      _isButtonDisabled = !(emailValid &&
          stateValid &&
          locationValid &&
          nameValid &&
          bvnValid &&
          detailsMatch);
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
          detailsMatch = true;
          _nameController.text = "$firstName $lastName";
          _showLocationIndicator = false;
          dateOfBirth = response.data["dateOfBirth"];
        });
      } else {
        setState(() {
          _showLocationIndicator = false;
        });
        _bvnController.clear();
        ScaffoldMessenger.of(context)
            .showSnackBar(customErrorBar("Invalid to BVN details"));
      }
    }
  }

  @override
  void dispose() {
    _locationController.dispose();
    _stateController.dispose();
    _nameController.dispose();
    _emailController.dispose();
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
                            Icons.person,
                            "first name",
                            "first name",
                            "",
                            true,
                            regExp: nameRegex,
                            controller: _firstNameController,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * .05),
                          child: SignInput(
                            Icons.person,
                            "middle name",
                            "middle name",
                            "",
                            true,
                            regExp: nameRegex,
                            controller: _middleNameController,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * .05),
                          child: SignInput(
                            Icons.person,
                            "last name",
                            "last name",
                            "",
                            true,
                            regExp: nameRegex,
                            controller: _lastNameController,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * .05),
                          child: SignInput(
                            Icons.email,
                            "email",
                            "must be a valid email",
                            "",
                            true,
                            regExp: emailRegExp,
                            controller: _emailController,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
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
                          child: Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * .05),
                            width: width,
                            decoration: BoxDecoration(
                              color: KConstants.baseFourRedColor,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.location_city,
                                  color: KConstants.baseRedColor,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: KConstants.baseRedColor,
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: DropdownButton(
                                      underline: null,
                                      value: _selectedItem,
                                      items: <DropdownMenuItem<String>>[
                                        DropdownMenuItem(
                                          value: "Edo",
                                          child: Text(
                                            "Edo",
                                            maxLines: 1,
                                            overflow: TextOverflow.fade,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "Montserrat",
                                              color: KConstants.baseTwoRedColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        DropdownMenuItem(
                                          value: "Abuja",
                                          child: Text(
                                            "Abuja",
                                            maxLines: 1,
                                            overflow: TextOverflow.fade,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "Montserrat",
                                              color: KConstants.baseTwoRedColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedItem = value as String;
                                          _stateController.text =
                                              value as String;
                                        });
                                      },
                                    )),
                                Text(
                                  "select state",
                                  style: TextStyle(
                                    fontFamily: "Monsterrat",
                                    fontSize: 12,
                                    color: KConstants.baseTwoRedColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * .05),
                          child: SetLocationCard(
                              onLocationChanged: changeValue,
                              accountSetup: true),
                        ),
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
