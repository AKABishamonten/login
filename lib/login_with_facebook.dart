import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'facebook.dart';

class LoginWithFacebook extends StatefulWidget {
  const LoginWithFacebook({Key? key}) : super(key: key);

  @override
  State<LoginWithFacebook> createState() => _LoginWithFacebookState();
}

class _LoginWithFacebookState extends State<LoginWithFacebook> {

  bool loggedIn = false;
  AccessToken? _accessToken;
  UserModel? _currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login with Facebook'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: _buildWidget(),
      ),
    );
  }

  Widget _buildWidget() {
    UserModel? user = _currentUser;
    if (user != null) {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: user.pictureModel!.width! /6,
                backgroundImage: NetworkImage(user.pictureModel!.url!),
              ),
              title: Text(user.name!),
              subtitle: Text(user.email!),
            ),
            const SizedBox(height: 20,),
            const Text(
              'Success'
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
              onPressed: signOut, 
              child: const Text('Sign out')
            )
          ]),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(height: 20,),
            const Text(
              'not SignIn'
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
              onPressed: signIn, 
              child: const Text('Sign In')
            )
          ],
        ),
      );
    }
  }

  Future<void>signIn() async {
    final LoginResult result = await FacebookAuth.i.login();
    if(result.status == LoginStatus.success) {
      _accessToken = result.accessToken;

      final data = await FacebookAuth.i.getUserData();
      UserModel model = UserModel.fromJson(data);

      _currentUser =model;
      setState(() {
        
      });
    }
  }

  Future<void>signOut() async {
    await FacebookAuth.i.logOut();
    _currentUser = null;
    _accessToken = null;
    setState((){

    });
  }
}


class UserModel{
  final String? email;
  final String? id;
  final String? name;
  final PictureModel? pictureModel;

  const UserModel({this.pictureModel, this.email, this.id, this.name, });
   factory UserModel.fromJson(Map<String, dynamic> json) =>
    UserModel(
    email: json['email'],
    id: json['id'] as String?,
    name: json['name'],
    pictureModel: PictureModel.fromJson(json['picture']['data']),
    );
}

class PictureModel { 
  final String? url;
  final int? width;
  final int? height;

  const PictureModel({this.url, this.height, this.width, });

  factory PictureModel.fromJson(Map<String, dynamic> json) =>
  PictureModel(
    url: json['url'],
    width: json['width'],
    height: json['height']
  );
}