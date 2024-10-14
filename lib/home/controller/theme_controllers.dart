import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:getxlightdarkmode/core/services/theme/theme.dart';

class ThemeController extends GetxController {
  Rx<ThemeData> themeData = lightMode.obs;

  @override
  void onInit() {
    super.onInit();
    _loadThemeFromPrefs();
  }

  void toggleTheme() async {
    if (themeData.value == lightMode) {
      themeData.value = dartMode;
    } else {
      themeData.value = lightMode;
    }
    await _saveThemeToPrefs();
  }

  void _loadThemeFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool('isDarkMode') ?? false;
    themeData.value = isDarkMode ? dartMode : lightMode;
  }

  Future<void> _saveThemeToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', themeData.value == dartMode);
  }
}
