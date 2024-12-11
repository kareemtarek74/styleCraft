import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light) {
    loadTheme();
  }

  void toggleTheme() async {
    final newTheme =
        state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    emit(newTheme);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', newTheme == ThemeMode.dark);
  }

  void loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool('isDarkMode') ?? false;
    emit(isDarkMode ? ThemeMode.dark : ThemeMode.light);
  }
}
