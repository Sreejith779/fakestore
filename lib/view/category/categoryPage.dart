import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_hr_management/view_models/controller/categoryController.dart';
import 'package:getx_hr_management/view_models/controller/detailPageCotroller.dart';
import 'package:lottie/lottie.dart';
import '../../res/utils/texts.dart';
import '../detailPage/detailPage.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryController controller = Get.put(CategoryController());
    DetailPageController detailPageController = Get.put(DetailPageController());
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.allProductList.isEmpty) {
          return   Center(child: Lottie.asset("assets/loading.json",
            height: height*0.08
          ),);
        } else {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8, // Adjusted aspect ratio for better UI

            ),
            itemCount: controller.allProductList.length,
            itemBuilder: (context, index) {
              var product = controller.allProductList[index];
              return  GestureDetector(
                onTap: (){
                  if(controller.allProductList[index]!=null){
                    detailPageController.product.value = product;
                    // detailPageController.product.assignAll({
                    //   "id" : product.id,
                    //   "title" : product.title,
                    //   "image" : product.image,
                    //   "description" : product.description,
                    //   "price" : product.price});
                    print(detailPageController.product);
                  }
                  Get.to(DetailPage());
                },
                child: Container(
                  height: height * 0.15,
                  width: width * 0.98,
                  margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.network(product.image.toString(),
                        height: 130,
                        width: 150,),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(truncateWithEllipsis(30,
                              product.title.toString()),
                          style: TextStyles.bText,),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Price ${product.price}",
                        style: TextStyles.bText,),
                      )

                    ],
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }

  String truncateWithEllipsis(int cutoff, String text) {
    return (text.length <= cutoff) ? text : '${text.substring(0, cutoff)}...';
  }
}
