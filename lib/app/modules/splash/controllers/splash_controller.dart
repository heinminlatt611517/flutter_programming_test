import 'package:flutter_programming_test/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(milliseconds: 5000),(){
      navigateToHomeScreen();
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void navigateToHomeScreen(){
    Get.offNamed(Routes.HOME);
  }
}

