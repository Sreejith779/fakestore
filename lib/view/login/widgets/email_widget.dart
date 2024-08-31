import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_hr_management/view_models/controller/login.dart';

class InputEmailWidget extends StatelessWidget {
  InputEmailWidget({super.key});

  @override
  Widget build(BuildContext context) {

    LoginController controller = Get.put(LoginController());
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
      child: TextFormField(

validator: (value){
  if(value!.isEmpty ||value == null){
    return "Field cannot be empty";
  }
},
        controller: controller.emailController.value,
        decoration:  InputDecoration(
          isDense: true,
          labelText: "email",
          border: OutlineInputBorder(

            borderRadius: BorderRadius.circular(15)
          )
        )
      ),
    );
  }
}
