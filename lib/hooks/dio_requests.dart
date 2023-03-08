import "package:dio/dio.dart";

// A class that defines four Dio methods
class ApiClient {
  // A field that holds the dio instance
  final Dio dio;

  // A constructor that takes a dio instance as an argument
  ApiClient(this.dio);

  // A method that sends a GET request
  Future<Response> get(String path) async {
    return await dio.get(path);
  }

  // A method that sends a POST request
  Future<Response> post(String path, dynamic data) async {
    return await dio.post(path, data: data);
  }

  // A method that sends a PUT request
  Future<Response> put(String path, dynamic data) async {
    return await dio.put(path, data: data);
  }

  // A method that sends a PATCH request
  Future<Response> patch(String path, dynamic data) async {
    return await dio.patch(path, data: data);
  }

  // A method that sends a DELETE request
  Future<Response> delete(String path) async {
    return await dio.delete(path);
  }
}
