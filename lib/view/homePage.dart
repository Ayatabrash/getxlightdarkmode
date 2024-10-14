import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxlightdarkmode/core/components/box.dart';
import 'package:getxlightdarkmode/core/components/button.dart';
import 'package:getxlightdarkmode/home/controller/theme_controllers.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    return Obx(() => Scaffold(
          backgroundColor:
              themeController.themeData.value.colorScheme.background,
          body: Center(
            child: MyBox(
              color: themeController.themeData.value.colorScheme.primary,
              child: MyButton(
                color: themeController.themeData.value.colorScheme.secondary,
                onTap: () {
                  themeController.toggleTheme();
                },
              ),
            ),
          ),
        ));
  }
}
