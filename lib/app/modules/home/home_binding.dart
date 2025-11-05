import 'package:get/get.dart';

import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Mendaftarkan HomeController agar bisa dipakai di HomeView
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}