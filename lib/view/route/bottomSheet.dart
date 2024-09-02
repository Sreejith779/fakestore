
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_hr_management/view/cartPage/cartPage.dart';
import 'package:getx_hr_management/view/searchPage/searchPage.dart';

import 'package:getx_hr_management/view_models/controller/routeController.dart';

import '../account/account.dart';
import '../homePage/homePage.dart';



class Routes extends StatelessWidget {


    Routes({super.key});

 

  @override
  Widget build(BuildContext context) {
    RouteController routeController = Get.put(RouteController());
    final List tabs = [
      HomePage(),
     SearchPage(),
    CartPage(),
      AccountPage(),
    ];
    
    return  Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Obx(() =>   NavigationBar(
            height: MediaQuery.of(context).size.height*0.08,
            selectedIndex: routeController.isSelect.value,
            onDestinationSelected: (value){
               routeController.updateIndex(value);
            },
            destinations:   [
              NavigationDestination(icon: Image.asset("assets/home.png",
              height: 22,),
                  label: "Home"),
              NavigationDestination(icon: Image.asset("assets/search.png",
              height: 22,),
                  label: "Search"),
              NavigationDestination(icon: Image.asset("assets/bag.png",
              height: 23,),
                  label: "Cart"),
              NavigationDestination(icon:  Image.asset("assets/person.png",
              height: 22,),
                  label: "Account"),

            ],
            backgroundColor: Colors.white,
            indicatorColor: Colors.white,
            indicatorShape: null,
          ))
         
        ),
      ),
      body: Obx(() => tabs[routeController.isSelect.value])

    );
  }
}