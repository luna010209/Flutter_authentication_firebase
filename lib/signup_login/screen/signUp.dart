import 'package:flutter/material.dart';
import 'package:flutter_authentication/signup_login/screen/home.dart';
import 'package:flutter_authentication/signup_login/screen/login.dart';
import 'package:flutter_authentication/signup_login/service/authentication.dart';
import 'package:flutter_authentication/signup_login/widget/button.dart';
import 'package:flutter_authentication/signup_login/widget/snackBar.dart';
import 'package:flutter_authentication/signup_login/widget/textField.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  bool isLoading = false;
  void signupUser() async {
    String res = await AuthService().signupUser(
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
    );
    if (res == "Signup Successful"){
      setState(() {
        isLoading = true;
      });
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> HomeScreen()));
    } else {
      setState(() {
        isLoading=false;
      });
      showSnackBar(context, res);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SizedBox(height: 35,),
                Image.asset('images/logo/signup.png', height: 200, width: double.infinity,),
                InputFields(
                  textEditingController: nameController,
                  hintText: "Input your name",
                  icon: Icons.person,
                ),
                InputFields(
                  textEditingController: emailController,
                  hintText: "Input your email",
                  icon: Icons.email,
                ),
                InputFields(
                  isPass: true,
                  textEditingController: passwordController,
                  hintText: "Input your password",
                  icon: Icons.key,
                ),
                SizedBox(height: 10,),
                MyButton(onTab: signupUser, text: "Sign Up",),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 18,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (content)=> LoginScreen()
                        ));
                      },
                      child: Text(
                        ' Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),]
        ),
      ),
    );
  }
}

