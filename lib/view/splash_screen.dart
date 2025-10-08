import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_pro/resources/colors/theme_colors.dart';
import 'package:test_pro/resources/routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Get.offNamed(RouteName.homeScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
       //   Lottie.asset("assets/animation/6LuQ9KVQQT.json"),
        
          
          Center(
            child: Text(
              "Splash Screen",
              style: TextStyle(fontSize: 40, color: themeredColor),
            ),
          ),
        ],
      ),
    );
  }
}
