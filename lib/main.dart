import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loginfuc/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //บังคับให้ทำสิ่งที่อยู่ด้านล่างก่อน
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget { //set theme data 
  const MyApp({Key? key}) : super(key: key);
  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}