import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:loginfuc/login_with_anony.dart';
import 'package:loginfuc/login_with_facebook.dart';
import 'package:loginfuc/login_with_google.dart';
import 'package:loginfuc/login_with_twitter.dart';

import 'login_with_email.dart';
import 'login_with_phone.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );

  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: true,
        title: Text("Select Option"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 240, 52, 52)),),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginWithGoogle()));
                  },
                  child: Text("Login with google")),
            ),
            SizedBox(
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 0, 0, 0)),),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text("Login with Phone")),
            ),
            SizedBox(
              child: ElevatedButton (
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 203, 14, 165)),),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginWithEmail()));
                  },
                  child: Text("Login with Email")),
            ),
            SizedBox(
              child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 14, 203, 115)),),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AnonSignIn()));
                  },
                  child: Text("Login with Anonymous")),
            ),
            SizedBox(
              child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 0, 136, 255)),),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginWithFacebook()));
                  },
                  child: Text("Login with Facebook")),
            ),
            SizedBox(
              child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 96, 172, 239)),),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginWithTwitter()));
                  },
                  child: Text("Login with Twitter")),
            ),
          ],
        )
      ),
    );
  }
}