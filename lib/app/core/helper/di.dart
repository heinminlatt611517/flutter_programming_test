import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'app_prefs.dart';
final instance = GetIt.instance;

Future<void> initAppModule() async {
  await GetStorage.init();

  final sharedPrefs = GetStorage();

//shared prefs instance
  instance.registerLazySingleton(() => sharedPrefs);

// app prefs instance
  instance.registerLazySingleton<AppPreference>(
          () => AppPreference(instance()));

}
