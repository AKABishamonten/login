import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loginfuc/login_fuction/authen_fuction.dart';
import 'package:loginfuc/page/login.dart';
import 'package:loginfuc/route/navigate.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //บังคับให้ทำสิ่งที่อยู่ด้านล่างก่อน
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<Authenfuction>(create: (_) => Authenfuction(),
    ),
   // ChangeNotifierProvider<UsersViewModel>(create: (_) => UsersViewModel(),)
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  //set theme data
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData.dark(),
      home: LoginPage(),
      routes: Navigate.routes,
    );
  }
}
