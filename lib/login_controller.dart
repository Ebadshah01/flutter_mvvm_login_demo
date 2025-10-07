import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  RxBool loading = false.obs; 
  RxBool isButtonEnable = false.obs;

  @override
  void onInit() {
    super.onInit();
    //  Yeh listeners fields me change detect karenge
    emailController.value.addListener(_checkFields);
    passwordController.value.addListener(_checkFields);
  }

  //  Yeh function check karega ke dono fields filled hain ya nahi
  void _checkFields() {
    final email = emailController.value.text.trim();
    final password = passwordController.value.text.trim();
    isButtonEnable.value = email.isNotEmpty && password.isNotEmpty;
  }

  void loginApi() async {
    loading.value = true;
    try {
      final response = await http.post(
        Uri.parse("https://reqres.in/api/login"),
        body: {
          "email": emailController.value.text,
          "password": passwordController.value.text,
        },
      );

      var data = jsonDecode(response.body);
      loading.value = false;

      if (response.statusCode == 200) {
        Get.snackbar("Login Successful", data["token"] ?? "No token found");
      } else {
        Get.snackbar("Login Failed", data["error"] ?? "Unknown error");
      }
    } catch (e) {
      loading.value = false;
      Get.snackbar("Exception", e.toString());
    }
  }
}
