import 'package:flutter/material.dart';

class AppThemeDark {
  static AppThemeDark? _instance;
  static AppThemeDark? get instance {
    _instance ??= AppThemeDark._init();
    return _instance;
  }

  AppThemeDark._init();

  ThemeData get theme => ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
          centerTitle: true,
        ),
      );
}
