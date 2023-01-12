import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AnonSignIn extends StatelessWidget {
  const AnonSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 14, 203, 115),
        title: Text("Login with anonymous"),
        centerTitle: true,
        
      ),
      body: Center(
        child: Column(
          children: [
            Text("Sign In Anonymously",),
            Text("You haven't signed in yet"),
            SizedBox(height: 15,),
          ElevatedButton(onPressed: () {
            if(FirebaseAuth.instance.currentUser != null) {
              FirebaseAuth.instance.signOut();
            } else {
              FirebaseAuth.instance.signInAnonymously();
            }
          }, child: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.userChanges(),
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                return const Text("Sign Out");
              } else {
                return const Text("Sign In");
              }
            },
          ))
          ],
        ),
      ),
    );
  }
}