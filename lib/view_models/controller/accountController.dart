import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:getx_hr_management/repository/account_repository/account_repository.dart';
import 'package:getx_hr_management/res/shared_prefernces/sharedPreference.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/userModel.dart';

class AccountController extends GetxController {
  RxString userName = "".obs;
 Rx<UserModel>userData = UserModel().obs;


  Future<void> loadCachedData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    userName.value = pref.getString("userName") ?? cachedData["username"];
    print(userName);

  }

  void getUserData() {
    AccountRepo accountRepo = AccountRepo();
    accountRepo.userData().then((value){
      userData.value = UserModel.fromJson(value);
      print(userData);
      if (userData.value!=null) {
        print("Name: ${userData.value.name!.firstname} ${userData.value.name!.lastname}");
      }
    }
    );
  }
}
