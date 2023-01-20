import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginfuc/profile.dart';
import 'package:twitter_login/twitter_login.dart';

Future twitterLoginAuth(context) async {
    final twitterLogin = TwitterLogin(
      apiKey: 'ydar7qx8yvD37vwSLsfKMHDPA',
      apiSecretKey: 'bkGEsyXIWl2HFHqOGko8A5H8iJt75iJMkRAz0KmhqyOHGOjyQM',
      redirectURI: 'loginfuc://',
    );
    
    await twitterLogin.login().then((value) async {
      final TwitterAuthCredential = TwitterAuthProvider.credential(
        accessToken: value.authToken!,
        secret: value.authTokenSecret!,
      );
      await FirebaseAuth.instance.signInWithCredential(TwitterAuthCredential);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ProfilePage()));
    });
  }