
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart' as facebookauthen;
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twitter_login/twitter_login.dart';

import '../page/profile.dart';

class Authenfuction extends ChangeNotifier {
  bool otpVisibility = false;
  String verificationID = "";
  FirebaseAuth auth = FirebaseAuth.instance;
  String logintype = "";
  var userdata = null;
  final googleSignIn = GoogleSignIn(
  );
//GoogleSignIn
Future googleLogin(context) async {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? userdata;
  final googleUser = await googleSignIn.signIn();
  if (googleUser == null) return;
  userdata = googleUser;

  final googleAuth = await googleUser.authentication;

  final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

  await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
  logintype = "google";
  notifyListeners();
  NavigateToProfile(context);
  });
}

//emailpass
Future emailpasswordLogin(context) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signInWithEmailAndPassword(
        email: "admintest@gmail.com", password: "123456789");
    logintype = "email";
    userdata = FirebaseAuth.instance.currentUser!;
    notifyListeners();
    NavigateToProfile(context);
  }


//FacebookLogin
Future facebookLogin(context) async {
  try {
    final facebookauthen.LoginResult loginResult =
        await facebookauthen.FacebookAuth.instance.login();
    userdata = await facebookauthen.FacebookAuth.instance.getUserData();
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    logintype = "facebook";
    userdata = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    notifyListeners();
    NavigateToProfile(context);
  } on FirebaseException catch (e) {
    print(e);
  }
}

//LineLogin
Future lineLogin(context) async {
  LineSDK.instance.setup("${1657836028}").then((_) {
    print("Line Auth SDK");
  });
  try {
    final result = await LineSDK.instance
        .login(scopes: ["profile", "openid", "email"]).then((value) async {
      final user = await LineSDK.instance.getProfile();
    logintype = "Line";
    userdata = await LineSDK.instance.getProfile();
    notifyListeners();
    NavigateToProfile(context);
    });
  } on PlatformException catch (e) {
    print(e);
  }
}

//anonymouslogin
Future anonymousLogin(context) async {
  try {
    logintype = "Anonymous";
    userdata = await FirebaseAuth.instance.signInAnonymously();
    print("Signed in with temporary account.");
    notifyListeners();
    NavigateToProfile(context);
  } on FirebaseAuthException catch (e) {
    switch (e.code) {
      case "operation-not-allowed":
        print("Anonymous auth hasn't been enabled for this project.");
        break;
      default:
        print("Unknown error.");
    }
  }
}

//twitterLogin
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
      logintype = "Twitter";
      userdata = await FirebaseAuth.instance.signInWithCredential(TwitterAuthCredential);
      notifyListeners();
      NavigateToProfile(context);
    });
  }
  //Phone
  Future phoneLogin(phone_number) async {
    auth.verifyPhoneNumber(
      phoneNumber: phone_number,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        otpVisibility = true;
        verificationID = verificationId;
        notifyListeners();
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  //OTP
  Future verifyOTP(context, otp) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otp);

    var user = await auth.signInWithCredential(credential);
    print("successfully");
    logintype = "phone";
    userdata = user;
    notifyListeners();
    NavigateToProfile(context);
  }

  Future signOut(context) async {
    switch (logintype) {
      case "google":
        await FirebaseAuth.instance.signOut();
        await googleSignIn.disconnect();
        break;
      case "facebook":
        await FirebaseAuth.instance.signOut();
        await facebookauthen.FacebookAuth.instance.logOut();
        break;
      case "line":
        LineSDK.instance.setup("${1657836028}");
        await LineSDK.instance.logout();
        break;
      case "phone":
        await FirebaseAuth.instance.signOut();
        break;
      case "email":
        await FirebaseAuth.instance.signOut();
        break;
      case "anonymous":
        await FirebaseAuth.instance.signOut();
        break;
      default:
        await FirebaseAuth.instance.signOut();
    }
    notifyListeners();
    Navigator.pushNamed(context, "/Login");
  }

  void NavigateToProfile(context) {
    Navigator.pushNamed(context, "/Profile");
  }
}