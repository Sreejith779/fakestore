import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_hr_management/repository/login_repository/login_repository.dart';
import 'package:getx_hr_management/res/routes/routes_names.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passController = TextEditingController().obs;
  RxBool isLoading = false.obs;

  void login() {
    final loginRepo = LoginRepository();
    isLoading.value = true;

    Map data = {
      "username": emailController.value.text,
      "password": passController.value.text
    };
    loginRepo.loginApi(data).then((value) {
      print("value : $value");
      isLoading.value = false;
      if (value != null) {
        Get.toNamed(RouteName.routes)!.then((value) {});
      } else {
        Get.snackbar(
            "Login Failed", "please make sure email and password is correct");
      }
    });
  }
}
