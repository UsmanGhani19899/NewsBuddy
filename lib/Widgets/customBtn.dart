import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBtn extends StatelessWidget {
  String? btnName;
  final onPressed;
  CustomBtn({super.key, this.btnName, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.07,
      width: Get.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.blue),
        child: Text("$btnName"),
        onPressed: onPressed,
      ),
    );
  }
}
