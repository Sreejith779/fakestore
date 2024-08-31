import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_hr_management/view_models/controller/detailPageCotroller.dart';
import 'package:getx_hr_management/view_models/controller/homeController.dart';

import '../../res/utils/texts.dart';
import '../../view_models/controller/searchController.dart';
import '../detailPage/detailPage.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    SearchControllers controller =
        Get.put(SearchControllers()..getAllProducts());
    // HomeController homeController = Get.put(HomeController());
    DetailPageController detailPageController = Get.put(DetailPageController());
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Search"),
        ),
        body: Obx(
          () => Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  height: height * 0.09,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.shade300,
                  ),
                  child: TextField(
                    onChanged: (value) {
                      controller.searchQuery.value = value;
                      controller.filteredList();
                    },
                    decoration: const InputDecoration(
                        hintText: "Search here",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: GridView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                    ),
                    itemCount: controller.searchList.isEmpty
                        ? controller.productList.length
                        : controller.searchList.length,
                    itemBuilder: (BuildContext context, index) {
                      var product = controller.searchList.isEmpty
                          ? controller.productList[index]
                          : controller.searchList[index];

                      return GestureDetector(
                        onTap: () {
                          if (controller.productList[index] != null) {
                            detailPageController.product.value = product;
                            // detailPageController.product.assignAll({
                            //   "id": product.id,
                            //   "title": product.title,
                            //   "image": product.image,
                            //   "description": product.description,
                            //   "price": product.price
                            // });
                            print(detailPageController.product);
                          }
                          Get.to(DetailPage());
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
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
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
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
                                  truncateWithEllipsis(
                                      30, product.title.toString()),
                                  style: TextStyles.bText,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "Price ${product.price}",
                                  style: TextStyles.bText,
                                ),
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
          ),
        ));
  }

  String truncateWithEllipsis(int cutoff, String text) {
    return (text.length <= cutoff) ? text : '${text.substring(0, cutoff)}';
  }
}
