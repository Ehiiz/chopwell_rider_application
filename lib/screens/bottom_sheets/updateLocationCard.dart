import 'package:chopwell_rider_application/screens/registration_page/loginPage.dart';
import 'package:chopwell_rider_application/services/third_party_services/google_location_service.dart';
import 'package:chopwell_rider_application/services/update_location_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

import '../../constants/constants.dart';
import '../../models/request_models/set_location_request_model.dart';

typedef LocationCallback = void Function(
    double latitude, double longitude, String address);

class SetLocationCard extends ConsumerStatefulWidget {
  final LocationCallback onLocationChanged;
  final bool accountSetup;

  const SetLocationCard(
      {Key? key, required this.onLocationChanged, required this.accountSetup})
      : super(key: key);

  @override
  ConsumerState<SetLocationCard> createState() =>
      _SetLocationCardState(this.onLocationChanged, this.accountSetup);
}

class _SetLocationCardState extends ConsumerState<SetLocationCard> {
  bool _setLocationLoader = false;
  bool _locationSetter = false;
  final LocationCallback onLocationChanged;

  String googleApikey = LocationService.key;
  GoogleMapController? mapController; //contrller for Google map
  CameraPosition? cameraPosition;
  LatLng startLocation = LatLng(6.4074885, 5.6073145);
  String location = "Search Location";
  double lat = 0.0;
  double lang = 0.0;
  final bool accountSetup;

  _SetLocationCardState(this.onLocationChanged, this.accountSetup);

  void _updateLocation(BuildContext context, String location, double latitude,
      double longitude) async {
    setState(() {
      _setLocationLoader = true;
    });
    final request = SetLocationRequestModel(
        location: location, latitude: latitude, longitude: longitude);
    final response = await UpdateLocationService.location(request);

    if (response.status == "success") {
      setState(() {
        _setLocationLoader = false;
        _locationSetter = false;
      });

      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        customSuccessBar("Location Updated Successfully"),
      );
    } else {
      setState(() {
        _setLocationLoader = false;
        _locationSetter = false;
      });
      print(response);

      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        customErrorBar("Unable to update location"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Material(
      elevation: 2.0,
      child: Container(
        alignment: Alignment.center,
        color: Colors.transparent,
        width: screenWidth,
        height: screenHeight * .3,
        child: Stack(children: [
          Positioned(
            child: InkWell(
              onTap: () async {
                var place = await PlacesAutocomplete.show(
                    context: context,
                    apiKey: googleApikey,
                    mode: Mode.fullscreen,
                    types: [],
                    strictbounds: false,
                    components: [Component(Component.country, 'ng')],
                    onError: (err) {
                      print(err);
                    });

                if (place != null) {
                  setState(() {
                    location = place.description.toString();
                  });

                  //form google_maps_webservice package
                  final plist = GoogleMapsPlaces(
                    apiKey: googleApikey,
                    apiHeaders: await GoogleApiHeaders().getHeaders(),
                    //from google_api_headers package
                  );
                  String placeid = place.placeId ?? "0";
                  final detail = await plist.getDetailsByPlaceId(placeid);
                  final geometry = detail.result.geometry!;
                  setState(() {
                    lat = geometry.location.lat;
                    lang = geometry.location.lng;
                  });
                }
              },
              child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Card(
                            child: Container(
                                padding: const EdgeInsets.all(0),
                                width: screenWidth - 40,
                                child: ListTile(
                                  title: Text(
                                    location,
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  trailing: const Icon(CupertinoIcons.location),
                                  dense: true,
                                )),
                          ),
                          OutlinedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                    KConstants.baseDarkColor,
                                  ),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                  padding: const MaterialStatePropertyAll(
                                    EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 15),
                                  )),
                              onPressed: accountSetup
                                  ? () {
                                      widget.onLocationChanged(
                                          lat, lang, location);
                                      Navigator.pop(context);
                                    }
                                  : () {
                                      _updateLocation(
                                        context,
                                        location,
                                        lat,
                                        lang,
                                      );
                                      setState(() {
                                        location = "";
                                        lat = 0.0;
                                        lat = 0.0;
                                      });
                                    },
                              child: Text(
                                _setLocationLoader
                                    ? ""
                                    : accountSetup
                                        ? "Set location"
                                        : "Update Location",
                                style: const TextStyle(
                                  fontFamily: "Questrial",
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ))
                        ],
                      ),
                      if (_setLocationLoader)
                        const Positioned.fill(
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  )),
            ),
          )
        ]),
      ),
    );
  }
}
