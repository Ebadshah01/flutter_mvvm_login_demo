import 'package:get/get.dart';
import 'package:test_pro/resources/routes/routes_name.dart';
import 'package:test_pro/view/auth/login_screen.dart';
import 'package:test_pro/view/home_screen.dart';
import 'package:test_pro/view/splash_screen.dart';

class AppRoutes {

   static appRoutes() => [
   GetPage(
    name: RouteName.splashScreen, 
    page: ()=> SplashScreen(),
    // transitionDuration: Duration(milliseconds: 250),
    // transition: Transition.leftToRightWithFade
    
    ),

   GetPage(
    name: RouteName.homeScreen, 
    page: ()=> HomeScreen(),
    ),

     GetPage(
    name: RouteName.loginScreen, 
    page: ()=> LoginScreen(),
    ),
  ];
}