import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:mail_tm_demo/controllers/register_controller.dart';
import 'package:mail_tm_demo/models/login_model.dart';
import 'package:mail_tm_demo/utils/app_constants.dart';
import 'package:mail_tm_demo/utils/app_logs.dart';
import 'package:mail_tm_demo/utils/app_strings.dart';

class LoginController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var count = 1.obs;
  late AnimationController controller;
  late Animation<Offset> offset;

  @override
  void onInit() {
    super.onInit();

    ///initialize of animation controller
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 800,
      ),
    );

    ///Initialize of tween animation offset
    offset = Tween<Offset>(begin: const Offset(-1.8, 0.0), end: Offset.zero)
        .animate(controller);
    controller.forward();

    /// fetch domain list for login user
    _fetchDomain();
  }

  _fetchDomain() {
    if (GlobalRef.domainNameGlobalRef.isEmpty) {
      var registerController = Get.put(RegisterController());
      registerController.fetchDomainList();
    }
  }

  bool formValidator({required String userName,required String pass})
  {
    if(userName.isNotEmpty && pass.isNotEmpty)
    {
      return true;
    }else{
      return false;
    }
  }

  Future<LoginModel> loginUser({required String address,required String password})async{

    Map<String, String> headers = {
      "Content-Type": "application/json"
    };
    try {
      var response = await post(Uri.parse(WebServiceUrl.login),
          body: json.encode({"address": address,'password':password}),headers: headers);
      AppLogs.logD('errorMsgBody=>${response.body}');
      return LoginModel.fromJson(json.decode(response.body));
    } catch (e) {
      AppLogs.logD('errorMsg=>${e.toString()}');
      return LoginModel(message: AppStrings.serverError);
    }
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
