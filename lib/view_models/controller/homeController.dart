import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:getx_hr_management/model/product_model.dart';
import 'package:getx_hr_management/repository/home_repository/home_repository.dart';

import '../../res/shared_prefernces/sharedPreference.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<ProductModel> allProductList = <ProductModel>[].obs;
  RxList categoryList = [].obs;

  final homeRepo = HomeRepository();
  String userId = cachedData['userId'];

  // @override
  // void onInit() {
  //
  //   getAllProducts();
  //   category();
  //   super.onInit();
  // }

  void getAllProducts() {
    isLoading.value = true;
    homeRepo.getAllProducts().then((value) {
      final List products = value;

      allProductList
          .addAll(products.map((e) => ProductModel.fromJson(e)).toList());
      print("value : $allProductList");
    });
  }

  void addToCart(ProductModel products) {
    try {

      Map<String, dynamic> data = {
        "userId": userId,
        "products": [{
          "productId" : products.id,
        }]
      };

      // homeRepo.addToCart(data);

      print("item added to cart: $data");
    } catch (e) {
      print(e.toString());
    }
  }
  void category(){
    homeRepo.category().then((value){
categoryList.addAll(value);
      print("categoryList : $value");
    });
  }
}
