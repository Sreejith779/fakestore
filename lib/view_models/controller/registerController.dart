

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_hr_management/repository/register_repository/register_repository.dart';
import 'package:getx_hr_management/view/route/bottomSheet.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController {
  final userNameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passController = TextEditingController().obs;
  final cPassController = TextEditingController().obs;

  final _apiService = RegisterRepository();

  void registerUser() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    Map data = {
      "email": emailController.value.text,
      "username": userNameController.value.text,
      "password": passController.value.text,
    };

    print(data);

    if (passController.value.text == cPassController.value.text) {
      _apiService.registerApi(data).then((value) {
        print("response : $value");
        sharedPreferences.setString("userId", "$value");
        sharedPreferences.setString("userName", data['username']);
        print("UserId : ${sharedPreferences.getString("userId")}");

        print("UserName : ${sharedPreferences.getString("userName")}");
        Get.off(Routes());
      });
    } else {
      Get.snackbar(
          "Registration Failed", "password and confirm password must be same");
    }
  }
}
