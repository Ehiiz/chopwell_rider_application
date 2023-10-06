// ignore_for_file: use_build_context_synchronously
import 'dart:io';
import 'package:chopwell_rider_application/authentication/token-utils.dart';
import 'package:chopwell_rider_application/authentication/user-utils.dart';
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
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _bvnController = TextEditingController();

  bool _showProgressIndicator = false;
  bool _showLocationIndicator = false;
  bool _imageSet = false;
  double latitude = 0.0;
  double longitude = 0.0;
  String dateOfBirth = "01-23-1998";
  String _selectedItem = "Edo";
  bool detailsMatch = false;
  String bvnName = "";

  bool _isButtonDisabled = true;

  File? selectedImage;
  bool _imageLoader = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateInput);
    _stateController.addListener(_validateInput);
    _nameController.addListener(_validateInput);
    _firstNameController.addListener(_validateInput);
    _lastNameController.addListener(_validateInput);
    _locationController.addListener(_validateInput);
    _bvnController.addListener(_validateInput);
  }

  Future<void> _getImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 1,
    );

    if (pickedFile != null) {
      File file = File(pickedFile.path);
      int sizeInBytes = file.lengthSync();
      double sizeInMb = sizeInBytes / (1024 * 1024);
      if (sizeInMb > 3) {
        ScaffoldMessenger.of(context).showSnackBar(
          customSuccessBar("Image size too large"),
        );
        return;

        // This file is Longer the
      }

      setState(() {
        selectedImage = file;
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
    String name = "${_firstNameController.text} ${_lastNameController.text}";
    final state = _stateController.text;
    final location = _locationController.text;
    final email = _emailController.text;
    final bvn = "12345678901";
    String phone = widget.phoneNumber;
    String? image;

    setState(() {
      _showProgressIndicator = true;
    });

    if (selectedImage == null) {
      image =
          "https://ik.imagekit.io/thelastkingpin/flutter_imagekit/pexels-mister-mister-3434523__2_.jpg?updatedAt=1688496946638";
    } else {
      image = await imageUpload(selectedImage!);
    }

    final request = CompleteAccountRequestModel(
      name: name,
      address: location,
      state: state,
      phone: phone,
      longitude: longitude,
      latitude: latitude,
      profile_picture: image!,
      bvn: bvn,
      dateOfBirth: dateOfBirth,
      email: email,
    );
    final response = await CompleteAccountService.setup(request);

    if (response.status == "success") {
      // include toast notification
      final user = response.data["rider"];

      await UserInfo.setUserInfo(user!);
      await AuthToken.setAuthToken(response.data["token"]);
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
      setState(() {
        _showProgressIndicator = false;
      });
    }
    // Do something with the email and password values
  }

  void _validateInput() {
    final emailValid = emailRegExp.hasMatch(_emailController.text);
    final stateValid = nameRegex.hasMatch(_stateController.text);
    final locationValid = nameRegex.hasMatch(_locationController.text);
    final lastNameValid = nameRegex.hasMatch(_lastNameController.text);
    final firstNameValid = nameRegex.hasMatch(_firstNameController.text);

    setState(() {
      _isButtonDisabled = !(emailValid &&
          stateValid &&
          locationValid &&
          lastNameValid &&
          firstNameValid);
    });
  }

  // void _fetchUserDetails() async {
  //   if (_bvnController.text.length == 11) {
  //     setState(() {
  //       _showLocationIndicator = true;
  //     });
  //     final request = BvnEnquiryRequestModel(bvn: _bvnController.text);

  //     final response = await BankEnquiryService().bvnEnquiry(request);
  //     if (response.status == "success") {
  //       // include toast notification

  //       final firstName = response.data["firstName"];
  //       final lastName = response.data["lastName"];
  //       setState(() {
  //         detailsMatch = true;
  //         bvnName = "$firstName $lastName";
  //         _showLocationIndicator = false;
  //         dateOfBirth = response.data["dateOfBirth"];
  //       });
  //     } else {
  //       setState(() {
  //         _showLocationIndicator = false;
  //       });
  //       _bvnController.clear();
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(customErrorBar("Invalid to BVN details"));
  //     }
  //   }
  // }

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
    return WillPopScope(
        child: SafeArea(
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
                              onTap: () {
                                _getImage();
                              },
                              child: Stack(
                                children: [
                                  _imageSet
                                      ? Ink.image(
                                          image: FileImage(selectedImage!),
                                          fit: BoxFit.cover,
                                          width: 100.0,
                                          height: 100.0,
                                          child: InkWell(
                                              child: _imageLoader
                                                  ? Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: KConstants
                                                            .baseTwoRedColor,
                                                      ),
                                                    )
                                                  : Container()
                                              // add any additional child widgets here
                                              ),
                                        )
                                      : Ink.image(
                                          image: AssetImage('assets/OIP.jpeg'),
                                          fit: BoxFit.cover,
                                          width: 100.0,
                                          height: 100.0,
                                          child: InkWell(
                                              child: _imageLoader
                                                  ? Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: KConstants
                                                            .baseTwoRedColor,
                                                      ),
                                                    )
                                                  : Container()
                                              // add any additional child widgets here
                                              ),
                                        ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "upload image",
                              style: TextStyle(
                                fontSize: 12.0,
                                fontFamily: "Montserrat",
                                color: KConstants.baseRedColor,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * .05),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: width * .4,
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
                                    SizedBox(
                                      width: width * .45,
                                      child: SignInput(
                                        Icons.person,
                                        "last name",
                                        "last name",
                                        "",
                                        true,
                                        regExp: nameRegex,
                                        controller: _lastNameController,
                                      ),
                                    )
                                  ],
                                )),
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
                            // Padding(
                            //   padding:
                            //       EdgeInsets.symmetric(horizontal: width * .05),
                            //   child: SignInput(
                            //     Icons.code,
                            //     "bvn",
                            //     "invalid BVN Details",
                            //     "enter your BVN",
                            //     true,
                            //     regExp: bvnRegex,
                            //     controller: _bvnController,
                            //   ),
                            // ),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: width * .05),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * .05),
                                width: width,
                                decoration: BoxDecoration(
                                  color: KConstants.baseFourRedColor,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                                  color: KConstants
                                                      .baseTwoRedColor,
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
                                                  color: KConstants
                                                      .baseTwoRedColor,
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
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        )),
                                      ),
                                      child: Text(
                                        _showProgressIndicator
                                            ? ''
                                            : "complete setup",
                                        // ignore: prefer_const_constructors
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
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
        ),
        onWillPop: () async {
          // Disable back button press
          return false;
        });
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
