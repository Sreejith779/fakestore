import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_hr_management/view_models/controller/login.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());

    return Obx(() {
      return
        controller.isLoading.value
            ? CircularProgressIndicator(color: Colors.white)
            : ElevatedButton(
        onPressed: controller.isLoading.value ? null : () {
          if (formKey.currentState!.validate()) {
            controller.login();
          } else {
            Get.snackbar('Error', 'Please fill all fields correctly');
          }
        },
        child:  const Text("Login"),
      );
    });
  }
}
