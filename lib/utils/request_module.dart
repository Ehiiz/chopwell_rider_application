import 'package:chopwell_rider_application/utils/url_constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RequestModule {
  static String baseUrl = '${AppURLS.BASE_URL}';
  static Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static Future<http.Response> post(String path, dynamic data,
      {Map<String, String>? headers}) async {
    final url = Uri.parse(baseUrl + path);
    final mergedHeaders = Map.from(defaultHeaders)
      ..addAll(headers?.cast<String, String>() ?? {});

    final finalHeaders = mergedHeaders.cast<String, String>();
    final response =
        await http.post(url, body: json.encode(data), headers: finalHeaders);
    return response;
  }

  static Future<http.Response> patch(String path, dynamic data,
      {Map<String, String>? headers}) async {
    final url = Uri.parse(baseUrl + path);
    final mergedHeaders = Map.from(defaultHeaders)
      ..addAll(headers?.cast<String, String>() ?? {});
    final finalHeaders = mergedHeaders.cast<String, String>();
    final response =
        await http.patch(url, body: json.encode(data), headers: finalHeaders);
    return response;
  }

  static Future<http.Response> get(String path,
      {Map<String, String>? headers}) async {
    final url = Uri.parse(baseUrl + path);
    final mergedHeaders = Map.from(defaultHeaders)
      ..addAll(headers?.cast<String, String>() ?? {});

    final finalHeaders = mergedHeaders.cast<String, String>();

    final response = await http.get(url, headers: finalHeaders);
    return response;
  }
}
