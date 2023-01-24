import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginfuc/page/phone.dart';
import 'package:provider/provider.dart';

import '../login_fuction/authen_fuction.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                .width, //ทำให้ contain ให้มีขนาดเท่ากับที่ตรวจจับได้ ****ควรใช้ terminal****
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //google
                ElevatedButton(
                  onPressed: () {
                    context.read<Authenfuction>().googleLogin(context);
                  },style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black,),
                    child: Text("Google"),
                ),
                //Email and Password
                ElevatedButton(
                  onPressed: () {
                    context.read<Authenfuction>().emailpasswordLogin(context);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red, ),
                  child: Text("Email")
                ),
                //Anonymous
                ElevatedButton(
                  onPressed: () {
                    context.read<Authenfuction>().anonymousLogin(context);
                  },style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey, ),
                  child: Text("Anonymous")
                ),
                //Facebook
                ElevatedButton(
                  onPressed: () {
                    context.read<Authenfuction>().facebookLogin(context);
                  },style: ElevatedButton.styleFrom(backgroundColor:Color.fromRGBO(59, 89, 152, 1), ),
                  child: Text("Facebook")
                ),
                //Twitter
                ElevatedButton(
                  onPressed: () {
                    context.read<Authenfuction>().twitterLoginAuth(context);
                  },style: ElevatedButton.styleFrom(backgroundColor:Color.fromRGBO(85, 172, 238, 1)),
                  child: Text("Twitter")
                ),
                //Phone
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/Phone");
                  },style: ElevatedButton.styleFrom(backgroundColor: Colors.black, ),
                  child: Text("Phone")
                ),
                //Line
                ElevatedButton(
                  onPressed: () {
                    context.read<Authenfuction>().lineLogin(context);
                  },style: ElevatedButton.styleFrom(backgroundColor:Color.fromRGBO(6, 199, 85, 1)),
                  child: Text("Line")
                ),
              ],
            )
       )
    );
  }
}