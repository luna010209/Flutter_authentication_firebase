import 'package:flutter/material.dart';
import 'package:flutter_authentication/signup_login/screen/login.dart';
import 'package:flutter_authentication/signup_login/service/authentication.dart';
import 'package:flutter_authentication/signup_login/widget/button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Welcome to my universe!!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  MyButton(
                    onTab: () async {
                      await AuthService().signOut();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => LoginScreen()
                      ));
                    },
                    text: "Log out"
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
