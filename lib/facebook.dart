import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart' as fbauth;
import 'package:loginfuc/profile.dart';

Future facebookLogin(context) async {
  try {
    final fbauth.LoginResult loginResult =
        await fbauth.FacebookAuth.instance.login();
    final userdata = await fbauth.FacebookAuth.instance.getUserData();
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ProfilePage()));
  } on FirebaseException catch (e) {
    print(e);
  }
}