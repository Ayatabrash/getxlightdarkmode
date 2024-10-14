import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxlightdarkmode/home/controller/theme_controllers.dart';
import 'package:getxlightdarkmode/view/homePage.dart';

void main() {
  Get.put(ThemeController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: Get.find<ThemeController>().themeData.value, // استخدام الثيم هنا
    );
  }
}
