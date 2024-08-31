import 'package:get/get.dart';
import 'package:getx_hr_management/repository/category_repository/category_repository.dart';
import '../../model/product_model.dart';

class CategoryController extends GetxController {
  RxList<ProductModel> allProductList = <ProductModel>[].obs;
  RxString category = "".obs;
  RxBool isLoading = false.obs;

  Future<void> getAllProduct({required String cat}) async {
    allProductList.clear();
    print("category : ${cat}");
    CategoryRepository categoryRepo = CategoryRepository();
    isLoading.value = true;

    try {
      categoryRepo.getCategoryProducts(categoryName: cat).then((value) {
        List product = value;
        allProductList
            .addAll(product.map((e) => ProductModel.fromJson(e)).toList());
        print("Products loaded: ${allProductList.length}");
      });
    } catch (e) {
      print("Error loading products: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
