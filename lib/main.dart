import 'package:flutter/material.dart';

import 'app/core/base/init_app.dart';
import 'app/my_app.dart';

void main() async{
  await initApp();
  runApp(
      const MyApp()
  );
}
