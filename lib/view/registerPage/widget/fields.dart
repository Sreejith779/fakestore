import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_hr_management/res/utils/texts.dart';
import 'package:getx_hr_management/view_models/controller/registerController.dart';

class Fields extends StatelessWidget {
  const Fields({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterController registerController = Get.put(RegisterController());
    final _formKey = GlobalKey<FormState>();
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;

    return

     Obx(() =>   Container(
       margin: const EdgeInsets.all(20),
       width: mWidth * 0.9,
       height: mHeight * 0.7,
       color: Colors.white.withOpacity(0.8),
       child: Form(
         key: _formKey,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text(
               "Register",
               style: TextStyles.bText.copyWith(fontSize: 26),
             ),
             _textfields(
                 "Username", registerController.userNameController.value),
             _textfields("Email", registerController.emailController.value),
             _textfields("Password", registerController.passController.value),
             _textfields(
                 "Confirm Password", registerController.cPassController.value),
             const SizedBox(
               height: 10,
             ),

             ElevatedButton(
                 style: ElevatedButton.styleFrom(
                     foregroundColor: Colors.white,
                     backgroundColor: Colors.black),
                 onPressed: () {
                    if(_formKey.currentState!.validate()){
                      registerController.registerUser();
                    }

                 },
                 child: const Text("Register"))
           ],
         ),
       ),
     ));
  }

  Widget _textfields(String labelTxt, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if(value==null || value!.isEmpty){
            return "Field cannot be empty";
          }
        },
        decoration: InputDecoration(
            isDense: true,
            labelText: labelTxt,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}
