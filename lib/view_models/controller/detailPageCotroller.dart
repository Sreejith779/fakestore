import 'package:get/get.dart';
import 'package:getx_hr_management/model/product_model.dart';
import 'package:getx_hr_management/res/cartList/cartList.dart';

class DetailPageController extends GetxController{

 Rx<ProductModel> product = ProductModel().obs;

void addToCart(ProductModel product){
 cartList.add(product);
 print(cartList);
}

}