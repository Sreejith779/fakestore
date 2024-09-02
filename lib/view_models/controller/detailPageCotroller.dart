import 'package:get/get.dart';
import 'package:getx_hr_management/model/product_model.dart';
import 'package:getx_hr_management/res/cartList/cartList.dart';

class DetailPageController extends GetxController{

 Rx<ProductModel> product = ProductModel().obs;

void addToCart(ProductModel product){


 if(cartList.contains(product)){
  return null;
 }else{
 cartList.add(product);
 print(cartList);}
 Get.snackbar("Added Successfully", "item added successfully");
}

}