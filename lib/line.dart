import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginfuc/profile.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';

Future lineLogin(context) async {
  LineSDK.instance.setup("${1657836028}").then((_) {
    print("Line Auth SDK");
  });
  try {
    final result = await LineSDK.instance
        .login(scopes: ["profile", "openid", "email"]).then((value) async {
      final user = await LineSDK.instance.getProfile();
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ProfilePage()));
    });
  } on PlatformException catch (e) {
    print(e);
  }
}