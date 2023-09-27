
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../RoutesAndBindings/app_routes.dart';
// import '../AppText/AppTextView.dart';
// import '../AppText/font_size.dart';

// Widget homeAppbar(
//     {required BuildContext context, required ProfileVM profileVM}) {
//   return Padding(
//     padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
//     child: Row(
//       children: [
//         Obx(
//           () => ClipOval(
//             child: CacheImageView(
//               image: profileVM.userData.value.profilePic,
//               height: 40,
//               width: 40,
//             ),
//           ),
//         ),
//         const SizedBox(
//           width: 10,
//         ),
//         Obx(
//           () => CustomText(
//             title:
//                 "Hi, ${"${profileVM.userData.value.firstName} ${profileVM.userData.value.lastName}"}",
//             size: setFontSize(fontSize: 18, context: context),
//             fontWeight: FontWeight.w700,
//             color: AppColor.black,
//           ),
//         ),
//         const Spacer(),
//         IconButton(
//             onPressed: () => Get.toNamed(AppRoutes.notificationView),
//             icon: const ImageIcon(
//               AssetImage('assets/icons/bell.png'),
//             )),
//       ],
//     ),
//   );
// }
