import 'package:flutter/material.dart';
import 'package:free1/Screen/Home/View/HomeScreen.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        getPages: [
          GetPage(
            name: '/',
            page: () => HomeScreen(),
          )
        ],
      ),
    ),
  );
}
