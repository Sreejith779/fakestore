import 'package:get/get.dart';
import 'package:getx_hr_management/res/routes/routes_names.dart';
import 'package:getx_hr_management/view/category/categoryPage.dart';
import 'package:getx_hr_management/view/detailPage/detailPage.dart';
import 'package:getx_hr_management/view/homePage/homePage.dart';
import 'package:getx_hr_management/view/registerPage/registerPage.dart';
import 'package:getx_hr_management/view/route/bottomSheet.dart';
import 'package:getx_hr_management/view/login/loginPage.dart';
import 'package:getx_hr_management/view/searchPage/searchPage.dart';

class AppRoute {
  static appRoute() => [
        GetPage(
          name: RouteName.loginPage,
          page: () => LoginPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,

        ),
    GetPage(
        name: RouteName.homePage,
        page: ()=> HomePage()),

    GetPage(name: RouteName.routes,
        page: ()=> Routes()),
    GetPage(name: RouteName.registerPage,
        page: ()=> RegisterPage()),
    GetPage(name: RouteName.categoryPage,
        page: ()=>CategoryPage()),
    GetPage(name: RouteName.detailPage,
        page: ()=> DetailPage() ),
    GetPage(name: RouteName.searchPage,
        page: ()=> SearchPage())
      ];
}
