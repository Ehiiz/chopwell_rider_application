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
    return Stack(children: [
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

            widget.onLocationChanged(
                geometry.location.lat, geometry.location.lng, location);
          }
        },
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: KConstants.baseFourRedColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ListTile(
                    title: Text(
                      location,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: KConstants.baseRedColor,
                      ),
                    ),
                    leading: Icon(
                      Icons.my_location_outlined,
                      color: KConstants.baseRedColor,
                    ),
                    dense: true,
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
    ]);
  }
}
