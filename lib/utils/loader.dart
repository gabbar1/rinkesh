import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io' show Platform;


showLoader() {
  Widget progressIndicator = Platform.isAndroid
      ? CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(
              Color(0xFF2C3BC7)),
        )
      : CupertinoActivityIndicator(
          radius: 14,
        );

  return Get.dialog(
    Center(child: progressIndicator),
    barrierColor: Colors.black.withOpacity(0.2),
    barrierDismissible: false,
  );
}

closeLoader() {
  Get.back();
}
