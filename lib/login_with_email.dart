import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loginfuc/main.dart';

import 'home_page.dart';

class LoginWithEmail extends StatefulWidget {
  const LoginWithEmail({Key? key}) : super(key: key);

  @override
  State<LoginWithEmail> createState() => _LoginWithEmailState();
}

class _LoginWithEmailState extends State<LoginWithEmail> {

  late String _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 203, 14, 165),
        title: Text("Login with Email"),
        centerTitle: true,
      ),
      body: Center(
          child: Container(
        margin: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(hintText: 'Email'),
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              }
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(hintText: 'Password'),
              onChanged: (value) {
                setState(() {
                  _password = value.trim();
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                auth.signInWithEmailAndPassword(email: _email, password: _password);
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
              }, child: Text('SignIn')
            ),
            ElevatedButton(
              onPressed: () {
                auth.createUserWithEmailAndPassword(email: _email, password: _password);
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
              }, child: Text('SignUp')
            ),
          ],
        ),
      )),
    );
  }
}
