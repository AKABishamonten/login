import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loginfuc/main.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    print(toString());
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(toString()),
            ElevatedButton(
                onPressed: () {
                  signOut(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: Text("signOut")),
          ],
        ),
      ),
    );
  }

  Future signOut(context) async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance.signOut();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => MyApp(),
          ),
          (route) => false);
    });
    final googleSignIn = GoogleSignIn();
    await googleSignIn.disconnect();
    try {
      LineSDK.instance.setup("${1657836028}").then((_) {});
      await LineSDK.instance.logout();
      print("Line Auth Logout");
    } on PlatformException catch (e) {
      print(e.message);
    }
  }
}
