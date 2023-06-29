import "dart:convert" as convert;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class LocationService {
  static final String key = dotenv.get('GOOGLE_MAP_KEY');

  static Future<String> getPlaceId(String input) async {
    final String url =
        "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$key";
    // work on url

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final json = convert.jsonDecode(response.body);

      final placeId = json['candidates'][0]['place_id'] as String;

      return placeId;
    } else {
      throw Exception('Failed to fetch placeId');
    }
  }

  static Future<Map<String, dynamic>> getPlace(String input) async {
    final placeId = await getPlaceId(input);

    final String url =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = convert.jsonDecode(response.body);
      final results = json['result'] as Map<String, dynamic>;

      return results;
    } else {
      throw Exception('Failed to fetch place');
    }
  }

  static Future<double> getDistance(LatLng origin, LatLng destination) async {
    final String url =
        'https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&origins=${origin.latitude},${origin.longitude}&destinations=${destination.latitude},${destination.longitude}&mode=driving&key=$key';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      final distance = data['rows'][0]['elements'][0]['distance']['value'];

      return distance.toDouble() / 1000.0; // Convert meters to kilometers
    } else {
      throw Exception('Failed to fetch distance');
    }
  }
}
