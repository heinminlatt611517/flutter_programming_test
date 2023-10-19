import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import '../helper/di.dart';
Future<void> initApp() async{
  final WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  if(!kIsWeb) {
    if (Platform.isAndroid) {
      binding.renderView.automaticSystemUiAdjustment = true;
    }
  }
}