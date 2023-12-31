import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controllers/splash_controller.dart';

class SplashView extends StatelessWidget {
   SplashView({Key? key}) : super(key: key);
  final controller = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/splash_animation.json',
          width: 300,
          height: 300,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
