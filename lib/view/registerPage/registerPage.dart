import 'package:flutter/material.dart';
import 'package:getx_hr_management/view/registerPage/widget/fields.dart';


class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: mWidth,
          height: mHeight,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage("https://sa.adanione.com/-/media/Project/Jaipur-Map-image/Experience-Jaipur-Airport/Shop--Other.jpg"),
            fit: BoxFit.cover)
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Fields()
            ],
          ),
        ),
      ),
    );
  }
}
