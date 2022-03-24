import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nasa_api/model/apod.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class ApiService {
 
  Future<Apod> getData() async {
    var url = 'api.nasa.gov';
    var urlExtension = '/planetary/apod';
    final Map<String, String> queryParameters = <String, String>{
      'api_key': '6u8YizBXHawwVvOgDaJXNXJoUoxQ2xTZzxXWC11Y',
    };
    final api = Uri.https(url, urlExtension, queryParameters);
    print(api);
 
    final response = await http.get(api);
 
    if (response.statusCode == 200) {
      return Apod.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load apod');
    }
  }

  List<Apod> parseApods(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Apod>((json) => Apod.fromJson(json)).toList();
}

  Future<List<Apod>> fetchApods() async {
  final response = await http
      .get(Uri.parse('https://api.nasa.gov/planetary/apod?api_key=6u8YizBXHawwVvOgDaJXNXJoUoxQ2xTZzxXWC11Y&count=10'));

  if (response.statusCode == 200) {
      return compute(parseApods, response.body);
    } else {
      throw Exception('Failed to load apod list');
    }
  }

  Future<bool> login(String user, String pass) async {
    var url = "http://www.sundarabcn.com/flutter/login.php";
    bool isLogin = false;
 
    var response = await http
        .post(Uri.parse(url), body: {'username': user, 'password': pass});
 
    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      if (jsondata["error"]) {
        showToast(jsondata["message"]);
        isLogin = false;
      } else if (jsondata["success"]) {
          showToast(jsondata["message"]);
          isLogin = true;
      }
    } else {
      showToast("Error de connexió");
      isLogin = false;
    }

    print("RESPONSE: " + response.statusCode.toString() + " isLogin: " + isLogin.toString());
    print("body: " + response.body.toString() + " headers: " + response.headers.toString());
    return isLogin;
  }

  showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

}