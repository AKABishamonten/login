import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:twitter_login/twitter_login.dart';

class LoginWithTwitter extends StatefulWidget {
  const LoginWithTwitter({Key? key}) : super(key: key);

  @override
  State<LoginWithTwitter> createState() => _LoginWithTwitterState();
}

class _LoginWithTwitterState extends State<LoginWithTwitter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 240, 52, 52),
        title: Text("Login With Google"),
      ),
      body: Center(
        child: 
        ElevatedButton(
          onPressed: (){
            login();
          },child: const Text('Login with Twitter'),
        ),
      ),
    );
  }

  void login() async {
    final twitterLogin = TwitterLogin(
      apiKey: 'WTznp0Dj71IiIXg0HAJlpVJJE',
      apiSecretKey: 'KJQKj6ILSe8Nr6q6Fe6Mde9rAXtXbHCsXvoKTg1HsFYljb0sQ8',
      redirectURI: 'loginfuc://',
    );
    
    await twitterLogin.login().then((value) async {
      final TwitterAuthCredential = TwitterAuthProvider.credential(
        accessToken: value.authToken!,
        secret: value.authTokenSecret!,
      );
      await FirebaseAuth.instance.signInWithCredential(TwitterAuthCredential);
    });
  }
}