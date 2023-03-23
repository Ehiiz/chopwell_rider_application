import "package:dio/dio.dart";

// A function that creates an instance of Dio with a base URL
Dio createDio(String baseUrl) {
  // Create an instance of Dio class
  Dio dio = Dio();
  // Set the base URL option
  dio.options.baseUrl = '${baseUrl}/v1/customer';
  // Return the dio instance
  return dio;
}
