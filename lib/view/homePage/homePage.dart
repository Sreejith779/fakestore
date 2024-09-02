import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_hr_management/view/homePage/widgets/product_view.dart';
import 'package:getx_hr_management/view_models/controller/homeController.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController()..getAllProducts()..category());
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        leading: Image.network(
          "https://th.bing.com/th/id/OIP.SDQX5MXs1tJxKLXN_rRSQAHaE8?rs=1&pid=ImgDetMain",
          fit: BoxFit.cover,
          height: 80,
          width: 100,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(

        child: Column(children: [
          Obx(() => homeController.isLoading.value
              ? const Expanded(child: ProductView())
              : Center(
                  child: Lottie.asset("assets/loading.json",
                      height: height * 0.08),
                ))
        ]),
      ),
    );
  }
}
