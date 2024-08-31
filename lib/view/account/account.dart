import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_hr_management/res/shared_prefernces/sharedPreference.dart';
import 'package:getx_hr_management/res/utils/texts.dart';
import 'package:getx_hr_management/view/account/widget/account_titles.dart';
import 'package:getx_hr_management/view_models/controller/accountController.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    AccountController controller = Get.put(AccountController()
      ..loadCachedData()
      ..getUserData());

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Obx(
            () => Text(
              "Hey! ${controller.userName}",
              style: TextStyles.headerText.copyWith(fontSize: 22),
            ),
          )),
      body: Container(
        margin: EdgeInsets.all(20),
        child:  AccountTitles()
      ),
    );
  }
}
