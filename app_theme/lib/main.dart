import 'package:app_theme/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'theme/theme_constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Theme',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().lightTheme(context),
      darkTheme: AppTheme().darkTheme(context),
      themeMode: ThemeMode.system,
      home: HomeScreen(),
    );
  }
}
