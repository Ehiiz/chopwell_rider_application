import 'package:shared_preferences/shared_preferences.dart';

class AuthToken {
  static Future<void> setAuthToken(String authToken) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("rider", authToken);
  }

  static Future<void> clearAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("rider");
  }

  static Future<String?> getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('rider');
    return token;
  }
}
