import 'package:flutter/material.dart';
import 'package:flutter_authentication/signup_login/screen/home.dart';
import 'package:flutter_authentication/signup_login/screen/signUp.dart';
import 'package:flutter_authentication/signup_login/service/authentication.dart';
import 'package:flutter_authentication/signup_login/widget/button.dart';
import 'package:flutter_authentication/signup_login/widget/snackBar.dart';
import 'package:flutter_authentication/signup_login/widget/textField.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 final TextEditingController emailController = TextEditingController();
 final TextEditingController passwordController = TextEditingController();
 bool isLoading = false;

 void dispose(){
   super.dispose();
   emailController.dispose();
   passwordController.dispose();
 }
 void loginUser() async {
   String res = await AuthService().loginUser(
       email: emailController.text,
       password: passwordController.text,
   );

   if (res == "Login successful!"){
     setState(() {
       isLoading=true;
     });
     Navigator.of(context).pushReplacement(
       MaterialPageRoute(
         builder: (context)=> HomeScreen(),
       )
     );
   } else {
     setState(() {
      isLoading=false;
     });
     showSnackBar(context, res);
   }
 }
 @override
 Widget build(BuildContext context){
   return Scaffold(
     backgroundColor: Colors.white,
     body: Center(
       child: ListView(
         shrinkWrap: true,
         children: [SizedBox(
           child: Column(
             // mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               // SizedBox(height: 35,),
               Image.asset('images/logo/logo.png', height: 300, width: double.infinity,),
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
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                 child: Align(
                   alignment: Alignment.centerRight,
                   child: Text(
                     'Forgot password?',
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       color: Colors.blue,
                       fontSize: 18,
                     ),
                   ),
                 ),
               ),
               MyButton(onTab: loginUser, text: "Login",),
               SizedBox(height: 30,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text('Don\'t have an account?',
                     style: TextStyle(
                       fontStyle: FontStyle.italic,
                       fontSize: 18,
                     ),
                   ),
                   GestureDetector(
                     onTap: (){
                       Navigator.push(
                         context,
                         MaterialPageRoute(
                             builder: (context)=>SignupScreen()
                         ),
                       );
                     },
                     child: Text(
                       ' Sign Up',
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
