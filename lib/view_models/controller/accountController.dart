import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:getx_hr_management/repository/account_repository/account_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/userModel.dart';

class AccountController extends GetxController {

 Rx<UserModel>userData = UserModel().obs;
RxBool isLoading = false.obs;

  Future<void> loadCachedData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();


  }

  Future<void> getUserData() async{
    isLoading.value = true;
    AccountRepo accountRepo = AccountRepo();
  await  accountRepo.userData().then((value){
      userData.value = UserModel.fromJson(value);
      isLoading.value = false;
      print(userData);
      if (userData.value!=null) {
        print("Name: ${userData.value.name!.firstname} ${userData.value.name!.lastname}");
      }
    }
    );
  }
}
