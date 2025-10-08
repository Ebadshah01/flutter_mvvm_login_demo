import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:test_pro/resources/colors/theme_colors.dart';

class Utils {
  static void fieldFocusChange(
    BuildContext context,
    FocusNode current,
    FocusNode nextFocus,
  ) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message, 
      backgroundColor: themeredColor,
      gravity: ToastGravity.BOTTOM
      
      );
  }

  static toastMessageCenter(String message) {
    Fluttertoast.showToast(
      msg: message, 
      backgroundColor: themeredColor,
      gravity: ToastGravity.CENTER
      
      );
  }

  static snackBar(String message,String title){
    Get.snackbar(title, message);
  }
}
