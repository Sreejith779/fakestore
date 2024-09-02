import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx_hr_management/res/categoryImage/categoryImg.dart';
import 'package:getx_hr_management/res/routes/routes_names.dart';
import 'package:getx_hr_management/res/utils/texts.dart';
import 'package:getx_hr_management/view/detailPage/detailPage.dart';
import 'package:getx_hr_management/view_models/controller/categoryController.dart';
import 'package:getx_hr_management/view_models/controller/detailPageCotroller.dart';
import 'package:getx_hr_management/view_models/controller/homeController.dart';
import 'package:lottie/lottie.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController()..getAllProducts());

    DetailPageController detailPageController = Get.put(DetailPageController());
    CategoryController categoryController = Get.put(CategoryController());
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Obx(() {
      if (homeController.allProductList.isEmpty) {
        return  Center(child: Lottie.asset("assets/loading.json",
            height: height*0.08
        ),);
      }

      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment:   CrossAxisAlignment.start,
          children: [
            Container(
              height: height * 0.15,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image:
                  NetworkImage(
                    "https://marketplace.canva.com/EAFYElY5EE4/1/0/800w/canva-brown-and-white-modern-fashion-banner-landscape-2uXtgbkdkec.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 10,right: 10),
              child: Text("Shop By Category",
              style: TextStyles.bText,),
            ),
            const SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 10,right: 20),
              height: height * 0.12,
              width: width * 0.98,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
           children: List.generate(homeController.categoryList.length,
                   (index) => Column(
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(left: 20),
                         child: GestureDetector(
                           onTap: (){
                             if(homeController.categoryList[index] != null){
                               categoryController.getAllProduct(cat:homeController.categoryList[index]);
                               print(categoryController.category.value);
                               Get.toNamed(RouteName.categoryPage);
                             }

                           },
                           child: CircleAvatar(
                             radius: 35,
                             backgroundColor: Colors.white,
                             backgroundImage: NetworkImage(CategoryImg[index]),
                           ),
                         ),
                       ),
                       Expanded(child: Text(truncateWithEllipsis(11,
                           homeController.categoryList[index]),
                       style: TextStyles.bText.copyWith(
                         fontSize: 14,
                         fontWeight: FontWeight.w600
                       ),))
                     ],
                   ))
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 8,right: 8),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                ),
                itemCount: homeController.allProductList.length,
                itemBuilder: (BuildContext context, index) {
                  var product = homeController.allProductList[index];

                  return GestureDetector(
                    onTap: (){
                      if(homeController.allProductList[index]!=null){
                        detailPageController.product.value = product;
                         // detailPageController.product.assignAll({
                         //   "id" : product.id,
                         // "title" : product.title,
                         // "image" : product.image,
                         // "description" : product.description,
                         // "price" : product.price});
                         print(detailPageController.product);
                      }
                      Get.to(DetailPage());
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                         color: Colors.white,
                       ),
                      child: Container(
                        margin: EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.network(
                                product.image.toString(),
                                height: height * 0.15,
                                width: width * 0.98,
                                loadingBuilder: (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.error,
                                    color: Colors.red,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              truncateWithEllipsis(30, product.title.toString()),
                              style: TextStyles.bText,
                            ),
                            const SizedBox(height: 5),

                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.star,color: Colors.orange,),
                                    Text("${product.rating!.rate.toString()} | ${product.rating!.count}"),
                                  ],
                                ),

                                // GestureDetector(
                                //   onTap: () {
                                //     homeController.addToCart(
                                //         homeController.allProductList[index]);
                                //   },
                                //   child: Container(
                                //     width: width * 0.3,
                                //     height: height * 0.045,
                                //     decoration: BoxDecoration(
                                //       color: Colors.deepPurple.shade400,
                                //       borderRadius: BorderRadius.circular(10),
                                //     ),
                                //     child: Center(
                                //       child: Text(
                                //         "Add to Cart",
                                //         style: TextStyles.bText
                                //             .copyWith(color: Colors.white),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                Text(
                                  "\$${product.price}",
                                  style: TextStyles.bText.copyWith(
                                    fontSize: 20,
                                    color: Colors.green
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }

  String truncateWithEllipsis(int cutoff, String text) {
    return (text.length <= cutoff) ? text : '${text.substring(0, cutoff)}';
  }
}
