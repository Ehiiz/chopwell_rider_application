import 'package:shared_preferences/shared_preferences.dart';

class AuthToken {
  static Future<void> setAuthToken(String authToken) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("customer", authToken);
  }

  static Future<String?> getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('customer');
    return token;
  }
}
