import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserInfo {
  static Future<void> setUserInfo(Object info) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("user", json.encode(info));
  }

  static Future<void> clearUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("user");
  }

  static Future<Object?> getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final user = prefs.getString('user');
    final myUser = json.decode(user!);
    return myUser;
  }

  static Future<void> setCoupons(dynamic coupon) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("coupons", json.encode(coupon));
  }

  static Future<Object?> getCoupons() async {
    final prefs = await SharedPreferences.getInstance();
    final coupons = prefs.getString('coupons');
    final myCoupons = json.decode(coupons!);
    return myCoupons;
  }
}
