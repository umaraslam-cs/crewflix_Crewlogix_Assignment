import 'dart:async';
import 'package:get/get.dart';

import '../../../RoutesAndBindings/app_routes.dart';

class SplashViewModel extends GetxController {
  Timer? timer;

  @override
  void onInit() {
    super.onInit();
    // TODO: implement onInit
    timer = Timer(const Duration(seconds: 3), () {
      checkCurrentUser();
    });
  }

  checkCurrentUser() async {
    Get.offAllNamed(AppRoutes.moviesListView);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer!.cancel();
  }
}
