import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone/Resources/auth_methods.dart';
import 'package:zoom_clone/Utils/colors.dart';
import 'package:zoom_clone/Widgets/coustom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: backgroundColor,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Start or Join a meeting!!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),


          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Image.asset('assets/images/onboarding.jpg'),
          ),
          
          CustomButton(
            onpressed: ()async{
              bool res = await _authMethods.signWithGoogle(context);

              if(res){
               Navigator.pushNamed(context, '/home');
              }
            },
            text: 'Google  Sign  In',

          )
        ],

      ),
    );
  }
}
