import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/product/theme/app_theme_dark.dart';

import 'features/home/view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeDark.instance!.theme,
      home: const HomeView(),
    );
  }
}
