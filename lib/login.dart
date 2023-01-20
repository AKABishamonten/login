import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginfuc/anonymous.dart';
import 'package:loginfuc/email.dart';
import 'package:loginfuc/facebook.dart';
import 'package:loginfuc/google.dart';
import 'package:loginfuc/line.dart';
import 'package:loginfuc/phone.dart';
import 'package:loginfuc/twitter.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {  late String _email, _password;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Select Option"),
        ),
        body: Container(
            width: MediaQuery.of(context)
                .size
                .width, //ทำให้ contain ให้มีขนาดเท่ากับที่ตรวจจับได้ ควรใช้ terminal
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    googleLogin(context);
                  },style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black,),
                    child: Text("Google"),
                ),
                ElevatedButton(
                  
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => EmailLogin()));
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red, ),
                  child: Text("Email")
                ),
                ElevatedButton(
                  onPressed: () {
                    anonymousLogin(context);
                  },style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey, ),
                  child: Text("Anonymous")
                ),
                ElevatedButton(
                  onPressed: () {
                    facebookLogin(context);
                  },style: ElevatedButton.styleFrom(backgroundColor:Color.fromRGBO(59, 89, 152, 1), ),
                  child: Text("Facebook")
                ),
                ElevatedButton(
                  onPressed: () {
                    twitterLoginAuth(context);
                  },style: ElevatedButton.styleFrom(backgroundColor:Color.fromRGBO(85, 172, 238, 1)),
                  child: Text("Twitter")
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPhone()));
                  },style: ElevatedButton.styleFrom(backgroundColor: Colors.black, ),
                  child: Text("Phone")
                ),
                ElevatedButton(
                  onPressed: () {
                    lineLogin(context);
                  },style: ElevatedButton.styleFrom(backgroundColor:Color.fromRGBO(6, 199, 85, 1)),
                  child: Text("Line")
                ),
              ],
            )
       )
    );
  }
}