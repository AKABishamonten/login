import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginfuc/login.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key,}) : super(key: key);

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
        width: MediaQuery.of(context)
                .size
                .width, 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(toString()),
            ElevatedButton(
                onPressed: () {
                  signOut(context);
                },style: ElevatedButton.styleFrom(backgroundColor:Colors.red),
                child: Text("signOut")),
          ],
        ),
      ),
    );
  }
Future signOut(context) async {
    await FirebaseAuth.instance.signOut();
    if (FirebaseAuth.instance.currentUser == null) {
      FirebaseAuth.instance.signOut();
      print("Firebase AuthsignOut");
      print(FirebaseAuth.instance.currentUser);
    }Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
}