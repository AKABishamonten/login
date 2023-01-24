import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loginfuc/response_data.dart';

class GetDataProvider with ChangeNotifier {
  ResponseData responseData = ResponseData();
  
  bool isLoading = false;

  getMyData() async {
 
    isLoading = true;
    responseData = await getAllData();
    isLoading = false;
    notifyListeners();
  }

  Future<ResponseData> getAllData() async {
    try {
      final response = await http
          .get(Uri.parse("https://raw.githubusercontent.com/AKABishamonten/login/main/pokeapi.json"));
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        responseData = ResponseData.fromJson(item);
        notifyListeners();
      } else {
        print("else");
      }
    } catch (e) {
      log(e.toString());
    }

    return responseData;
  }
}