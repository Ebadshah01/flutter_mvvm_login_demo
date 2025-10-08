import 'package:flutter/material.dart';
import 'package:test_pro/resources/colors/theme_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("LoginScreen",style: TextStyle(fontSize: 30,color: themeredColor),),
      ),
    );
  }
}