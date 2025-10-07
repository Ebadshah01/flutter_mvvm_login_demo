import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:test_pro/data/app_exception.dart';
// ignore: depend_on_referenced_packages
import 'package:test_pro/login_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
      throw InternetException("MESSAGE");
      },),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Text pro"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: controller.emailController.value ,
              decoration: InputDecoration(
                hintText: "Email",
                
              ),
            ),
            SizedBox(height: 20,),
             TextFormField(
              controller: controller.passwordController.value ,
              decoration: InputDecoration(
                hintText: "Password",
                
              ),
            ),
            SizedBox(height: 50,),
Obx(() {
  return InkWell(
    onTap: controller.isButtonEnable.value
        ? () {
            controller.loginApi();
          }
        : null,
    child: Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: controller.isButtonEnable.value ? Colors.red : Colors.grey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: controller.loading.value
            ? const CircularProgressIndicator(color: Colors.white)
            : const Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    ),
  );
})

          ],
        ),
      ),
    );
  }
}