import 'package:get/get.dart';

class RouteController extends GetxController{

  RxInt isSelect = 0.obs;

  void updateIndex(int index){
    isSelect.value = index;
  }
}