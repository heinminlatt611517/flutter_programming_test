import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/values/color_manager.dart';
import '../../../core/values/font_manager.dart';
import '../../../core/values/values_manager.dart';
import '../controllers/splash_controller.dart';

class SplashView extends StatelessWidget {
  SplashView({Key? key}) : super(key: key);
  final controller = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            Positioned(
              top: AppSize.s40,
              left: AppSize.s0,
              child: Container(
                width: AppSize.s50,
                height: AppSize.s100,
                decoration: BoxDecoration(
                    color: ColorManager.primary,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(AppSize.s190),
                        bottomRight: Radius.circular(AppSize.s190))),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: AppSize.s50,
                height: AppSize.s100,
                decoration: BoxDecoration(
                    color: ColorManager.primary,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(AppSize.s190),
                        bottomLeft: Radius.circular(AppSize.s190))),
              ),
            ),
            Positioned(
              bottom: AppSize.s0,
              left: AppSize.s0,
              child: Container(
                width: AppSize.s65,
                height: AppSize.s140,
                decoration: BoxDecoration(
                    color: ColorManager.primary,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(AppSize.s190),
                        bottomRight: Radius.circular(AppSize.s190))),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/app_logo.jpeg",
                  width: AppSize.s200,
                  height: AppSize.s200,
                ),
                Container(
                  width: Get.width,
                  // margin: EdgeInsets.symmetric(vertical: 0.2.sh),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Loading ...',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      const SizedBox(height: AppSize.s25,),
                      CircularProgressIndicator(
                        // backgroundColor: Colors.black,
                        valueColor:
                        AlwaysStoppedAnimation<Color>(ColorManager.primary),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
                bottom: 50,
                right: 0,
                left: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '©Copyright 2023 TASK',
                      style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: FontSize.s12),
                    ),
                    const SizedBox(height: AppSize.s8,),
                    Text(
                      'Version - 1.0.0',
                      style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: FontSize.s12),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
