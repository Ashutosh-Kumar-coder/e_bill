import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Resources {
  static void getMessage(BuildContext context, String message) async {
    var snackBar = ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 2),
      content: Text("$message"),
      margin: EdgeInsets.only(bottom: 50.0, left: 10.0, right: 10.0),
      // padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
      behavior: SnackBarBehavior.floating,
    ));
    // Scaffold.of(context)..hideCurrentSnackBar();
  }

//Save User
  static Future<bool> savePref(String key, var value) async {
    var pref = await SharedPreferences.getInstance();
    return pref.setString(key, value);
  }

//for login
  static Future<String> getPref(String key) async {
    var pref = await SharedPreferences.getInstance();

    return pref.getString(key);
  }

//Remove key
  static Future<bool> removePref(String key) async {
    var pref = await SharedPreferences.getInstance();
    return pref.remove(key);
  }

  ///Add user List
  static Future<bool> addUserList(List<String> userList) async {
    var pref = await SharedPreferences.getInstance();
    return pref.setStringList("userList", userList);
  }

  ///Add Item to card
  static Future<bool> additem() async {
    var pref = await SharedPreferences.getInstance();
  }
}
