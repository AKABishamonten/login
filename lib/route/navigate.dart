import 'package:flutter/material.dart';
import 'package:loginfuc/page/login.dart';
import 'package:loginfuc/page/phone.dart';
import 'package:loginfuc/page/profile.dart';

class Navigate {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/Login': (BuildContext context) => LoginPage(),
    '/Phone': (BuildContext context) => LoginPhone(),
    '/Profile': (BuildContext context) => ProfilePage(),
  };
}
