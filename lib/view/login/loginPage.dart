import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_hr_management/res/routes/routes.dart';
import 'package:getx_hr_management/res/routes/routes_names.dart';
import 'package:getx_hr_management/view/login/widgets/email_widget.dart';
import 'package:getx_hr_management/view/login/widgets/loginButton.dart';
import 'package:getx_hr_management/view/login/widgets/pass_widget.dart';
import 'package:getx_hr_management/view/registerPage/registerPage.dart';
import 'package:getx_hr_management/view_models/controller/login.dart';

import '../../res/utils/texts.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Container(
          height: mHeight,
          width: double.maxFinite,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image:
                NetworkImage("https://vipmalaysia.com/wp-content/uploads/2020/11/first-world-plaza-genting-highlands-shopping-mall.jpg",),
            fit: BoxFit.cover)
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: mHeight * 0.6,
                width: mWidth * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,  // Center items horizontally
                    children: [
                      Text(
                        "Login",
                        style: TextStyles.headerText.copyWith(fontSize: 28),
                      ),
                      InputEmailWidget(),
                      const PassWidget(),
                      const SizedBox(height: 10),
                      LoginButton(formKey: _formKey),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Text(
                            "Forgot password?",
                            style: TextStyles.regularText,
                          ),
                          Text(
                            " Reset",
                            style: TextStyles.bText.copyWith(color: Colors.deepPurple,
                            fontSize: 14),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Text(
                            "Don't have an account?",
                            style: TextStyles.regularText,
                          ),
                          InkWell(
                            onTap: (){
                             Get.to(RegisterPage());
                            },
                            child: Text(
                              " Register",
                              style: TextStyles.bText.copyWith(color: Colors.deepPurple,
                              fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
