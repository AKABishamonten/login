import 'package:flutter/material.dart';
import 'package:loginfuc/login_fuction/authen_fuction.dart';
import 'package:provider/provider.dart';

class LoginPhone extends StatefulWidget {
  const LoginPhone({Key? key}) : super(key: key);

  @override
  _LoginPhoneState createState() => _LoginPhoneState();
}

class _LoginPhoneState extends State<LoginPhone> {

  TextEditingController phoneController = TextEditingController(text: "+66");
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var otpvisible = context.watch<Authenfuction>().otpVisibility;
    return Scaffold(
      appBar: AppBar(
        title: Text("Login With Phone"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: "Phone number"),
              keyboardType: TextInputType.phone,
            ),
            Visibility(
              child: TextField(
                controller: otpController,
                decoration: InputDecoration(labelText: "OTP"),
                keyboardType: TextInputType.number,
              ),
              visible: context.watch<Authenfuction>().otpVisibility,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  if (otpvisible) {
                    context
                        .read<Authenfuction>()
                        .verifyOTP(context, otpController.text);
                  } else {
                    context
                        .read<Authenfuction>()
                        .phoneLogin(phoneController.text);
                  }
                },
                child: Text(otpvisible ? "Verify" : "Login")),
          ],
        ),
      ),
    );
  }
}