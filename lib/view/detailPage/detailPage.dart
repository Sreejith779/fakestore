import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_hr_management/res/utils/texts.dart';
import 'package:getx_hr_management/view_models/controller/detailPageCotroller.dart';
import 'package:getx_hr_management/view_models/controller/homeController.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    DetailPageController controller = Get.put(DetailPageController());
    HomeController homeController = Get.put(HomeController());
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Container(
        height: height * 0.1,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15), topLeft: Radius.circular(15)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 8, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total Price",
                    style: TextStyles.regularText.copyWith(fontSize: 15),
                  ),
                  Text(
                    "\$${controller.product.value.price}",
                    style: TextStyles.bText.copyWith(fontSize: 22),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 8, bottom: 8),
              child: Container(
                height: height * 0.1,
                width: width * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.withOpacity(0.5),
                ),
                child: Row(
                  children: [
                    Container(
                      width: width * 0.2,
                      height: height * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15)),
                        color: Colors.green.shade400,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Image.asset(
                          "assets/bag.png",
                          color: Colors.white,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
controller.addToCart(controller.product.value);
                      },
                      child: Container(
                        width: width * 0.3,
                        height: height * 0.4,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                          color: Colors.black,
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Center(
                              child: Text(
                                "Buy Now",
                                style: TextStyles.bText
                                    .copyWith(color: Colors.white, fontSize: 18),
                              ),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(truncateWithEllipsis(
          20,
          controller.product.value.title.toString(),
        )),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height * 0.5,
                width: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Image.network(
                    controller.product.value.image.toString(),
                  ),
                ),
              ),
              Text(controller.product.value.title.toString(),
                  style: TextStyles.headerText.copyWith(fontSize: 20)),
              const SizedBox(
                height: 5,
              ),
              Text(
                controller.product.value.description.toString(),
                style: TextStyles.regularText,
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String truncateWithEllipsis(int cutoff, String text) {
    return (text.length <= cutoff) ? text : '${text.substring(0, cutoff)}';
  }
}
