import 'package:flutter/material.dart';
import 'package:loginfuc/login_fuction/authen_fuction.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    print(toString());
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex"),
        actions: [
          IconButton(
              onPressed: () {
                context.read<Authenfuction>().signOut(context);
              },
              icon: Icon(Icons.exit_to_app)),
        ],
      ),
      body: Container(
      ),
    );
  }

}
