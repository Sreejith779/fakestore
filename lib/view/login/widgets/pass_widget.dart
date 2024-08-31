import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../view_models/controller/login.dart';

class PassWidget extends StatelessWidget {
  const PassWidget({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return  Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
      child: TextFormField(
controller: controller.passController.value,
          validator: (value){
  if(value!.isEmpty || value == null){
    return "Field cannot be empty";
  }
          },
          decoration:  InputDecoration(
            isDense: true,
              labelText: "password",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
              )
          )
      ),
    );
  }
}
