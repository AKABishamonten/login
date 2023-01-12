import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'main.dart';

class FacebookPage extends StatefulWidget {
  const FacebookPage({Key? key, this.image, this.name, this.email}) : super(key: key);

  @override
  State<FacebookPage> createState() => _FacebookPageState();
  final image;
  final name;
  final email;
}

class _FacebookPageState extends State<FacebookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login TO Facebook'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(widget.image, height: 200, width: 200,),
            Text(widget.name),
            Text(widget.email),
            SizedBox(height: 100),
            ElevatedButton(
                onPressed: (){
                  FacebookAuth.i.logOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Text('Logout')),
          ],
        ),
      ),
    );
  }
}