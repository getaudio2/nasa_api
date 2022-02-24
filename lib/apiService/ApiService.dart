import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nasa_api/model/apod.dart';
import 'dart:convert';

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
      throw Exception('Failed to load album');
    }
  }
}