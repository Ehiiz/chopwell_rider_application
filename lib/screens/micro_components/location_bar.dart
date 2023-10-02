import 'dart:convert';
import 'package:chopwell_rider_application/screens/registration_page/loginPage.dart';
import 'package:chopwell_rider_application/services/third_party_services/google_location_service.dart';
import 'package:chopwell_rider_application/services/update_location_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:maps_places_autocomplete/model/place.dart';

import '../../constants/constants.dart';
import '../../models/request_models/set_location_request_model.dart';

typedef LocationCallback = void Function(
    double latitude, double longitude, String address);

class LocationBar extends ConsumerStatefulWidget {
  final LocationCallback onLocationChanged;
  final bool accountSetup;
  final String address;
  const LocationBar(
      {Key? key,
      required this.onLocationChanged,
      required this.accountSetup,
      required this.address})
      : super(key: key);

  @override
  ConsumerState<LocationBar> createState() =>
      _LocationBarState(this.onLocationChanged, this.accountSetup);
}

class _LocationBarState extends ConsumerState<LocationBar> {
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

  _LocationBarState(this.onLocationChanged, this.accountSetup);

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
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        customErrorBar("Unable to update location"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: KConstants.baseDarkColor,
        borderRadius: BorderRadius.circular(20),
      ),
      width: screenWidth * .6,
      child: Stack(children: [
        InkWell(
          onTap: () async {
            var place = await PlacesAutocomplete.show(
                context: context,
                apiKey: googleApikey,
                mode: Mode.overlay,
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
             // _updateLocation(context, location, geometry.location.lat, geometry.location.lng);

              widget.onLocationChanged(
                  geometry.location.lat, geometry.location.lng, location);
            }
          },
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/location.svg",
                          width: 25,
                          height: 25,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: screenWidth * .5,
                          child: Text(
                            widget.address,
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontFamily: "Montserrat",
                              overflow: TextOverflow.clip,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
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
          ),
        ),
      ]),
    );
  }
}
