import 'package:get/get.dart';

import '../modules/create_new_task/bindings/create_new_task_binding.dart';
import '../modules/create_new_task/views/create_new_task_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
        transition: Transition.zoom,
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
        transition: Transition.zoom
    ),
    GetPage(
      name: _Paths.CREATE_NEW_TASK,
      page: () => const CreateNewTaskView(),
      binding: CreateNewTaskBinding(),
        transition: Transition.zoom
    ),
  ];
}
