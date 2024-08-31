import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/state_manager.dart';
import 'package:getx_hr_management/repository/home_repository/home_repository.dart';

import '../../model/product_model.dart';

class SearchControllers extends GetxController {
  RxBool isLoading = false.obs;

  RxString searchQuery = "".obs;

  RxList<ProductModel> productList = <ProductModel>[].obs;
  RxList<ProductModel> searchList = <ProductModel>[].obs;

  Future<void> getAllProducts() async{
    HomeRepository homeRepo = HomeRepository();
    isLoading.value = true;
    homeRepo.getAllProducts().then((value) {
      final List products = value;

       productList.addAll(products.map((e) => ProductModel.fromJson(e)).toList());
      print("value : $productList");
    });

  }

  void filteredList(){
print(searchQuery);
   final filteredList =  productList.where((e) =>
       e.title!.toLowerCase().contains(searchQuery.toLowerCase())).toList();
searchList.clear();
   searchList.addAll(filteredList);
  }
}
