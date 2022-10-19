import 'package:flutter/material.dart';
import 'package:get/get.dart';

appSnackBar({required String message,AppStatusCode statusCode=AppStatusCode.warning}){

  Get.snackbar(capitalize(statusCode.name).toString(), message,
      snackPosition: SnackPosition.BOTTOM,margin: const EdgeInsets.all(10),backgroundColor: Colors.white24);
}

enum AppStatusCode{
  success,
  failed,
  loading,
  confirm,
  warning
}

String? capitalize(String? s) => (s != null && s.length > 1)
    ? s[0].toUpperCase() + s.substring(1)
    : s?.toUpperCase();