import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'my_text.dart';

void showMySnackBar(String message) {
  ScaffoldMessenger.of(Get.context!).showSnackBar(
    SnackBar(
      content: MyText(
        text: message,
        color: Color(0xffFFFFFFF),
      ),
    ),
  );
}
