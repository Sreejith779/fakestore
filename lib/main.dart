import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_hr_management/res/routes/routes.dart';
import 'package:getx_hr_management/res/routes/routes_names.dart';
import 'package:getx_hr_management/res/shared_prefernces/sharedPreference.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final fcmToken = await FirebaseMessaging.instance.getToken();
  print(fcmToken);
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String? userId = sharedPreferences.getString("userId");
  String? userNames = sharedPreferences.getString("userName");
  print(userNames);
  cachedData.update("username", (value) => userNames);
// cachedData.assign("userName", "$userNames");
  cachedData.assign("userId", "$userId");
  print("cachedData $cachedData");

  runApp(MyApp(
    userId: userId,
  ));
}

class MyApp extends StatelessWidget {
  String? userId;
  MyApp({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: userId == null ? RouteName.loginPage : RouteName.routes,
        getPages: AppRoute.appRoute());
  }
}
