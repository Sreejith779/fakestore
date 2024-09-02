// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:getx_hr_management/res/utils/texts.dart';
// import 'package:getx_hr_management/view_models/controller/accountController.dart';
//
// class AccountTitles extends StatelessWidget {
//   const AccountTitles({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     AccountController controller = Get.put(AccountController());
// final user = controller.userData.value;
//     return Obx(() =>  Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//
//         _title("Name","${user.name!.firstname} ${user.name!.lastname}"),
//         _title("Email","${user.email}"),
//         _title("Phone","${user.phone}"),
//         _title("City","${user.address!.city}"),
//         _title("Street","${user.address!.street} ${user.address!.zipcode}"),
//
//
//       ],
//     ) );
//
//
//   }
//   Widget _title(String titleName,String name){
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(titleName,
//           style: TextStyles.bText.copyWith(
//             color: Colors.blue,
//             fontWeight: FontWeight.w400
//           ),),
//           Text(name,style: TextStyles.bText.copyWith(
//             fontSize: 20,
//             fontWeight: FontWeight.w500
//           ),)
//         ],
//       ),
//     );
//   }
// }
