
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/values/theme_manager.dart';
import 'routes/app_pages.dart';
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      smartManagement: SmartManagement.full,
      navigatorKey:navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      initialRoute: AppPages.INITIAL,
      defaultTransition: Transition.cupertino,
      getPages: AppPages.routes,
    );
  }
}
