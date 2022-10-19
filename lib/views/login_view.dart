// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mail_tm_demo/app_cache/session_manager.dart';
import 'package:mail_tm_demo/app_routes/app_pages.dart';
import 'package:mail_tm_demo/controllers/login_controller.dart';
import 'package:mail_tm_demo/custom_widgets/app_text_field.dart';
import 'package:mail_tm_demo/custom_widgets/loader.dart';
import 'package:mail_tm_demo/models/login_model.dart';
import 'package:mail_tm_demo/utils/app_colors.dart';
import 'package:mail_tm_demo/utils/app_constants.dart';
import 'package:mail_tm_demo/utils/app_dimens.dart';
import 'package:mail_tm_demo/utils/helpers.dart';

class LoginView extends GetView<LoginController> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  LoginView({Key? key}) : super(key: key);

  Future _storeUserInfo(LoginModel model,String userName) async {
    await storeUserGeneralInfo(token: 'Bearer ${model.token.toString()}',
        status: true,
        userId: model.id.toString(),
        userName: userName+GlobalRef.domainNameGlobalRef);
  }

  _topSection(){
    return SlideTransition(
      position: controller.offset,
      textDirection: TextDirection.rtl,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Let\'s get started',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 35),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text.rich(
              TextSpan(
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  const TextSpan(
                    text: 'Please put on,',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white),
                  ),
                  TextSpan(
                      text: '\nYour credentials for login.',
                      style: TextStyle(
                          height: 3,
                          color: Colors.white.withOpacity(.8),
                          letterSpacing: 2)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _bottomSection(BuildContext context){
    return SlideTransition(
      position: controller.offset,
      textDirection: TextDirection.ltr,
      child: Column(
        children: [
          AppTextField(
            labelName: 'Enter  username',
            controller: _emailController,
          ),
          const SizedBox(
            height: 20,
          ),
          AppTextField(
            labelName: 'Enter your password',
            controller: _passController,
            obscureText: true,
          ),
          const SizedBox(
            height: 80,
          ),
          SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  ///remove focus
                  FocusScope.of(context).requestFocus( FocusNode());

                  var valid = controller.formValidator(
                      userName: _emailController.text,
                      pass: _passController.text);
                  if (valid) {
                    Navigator.of(context).push(Loader());
                    var res = await controller.loginUser(
                        address: _emailController.text +
                            GlobalRef.domainNameGlobalRef.toString(),
                        password: _passController.text);
                    Navigator.pop(context);
                    if (res.message == null) {
                      await _storeUserInfo(res,_emailController.text);
                      Get.offNamed(AppPages.home);
                    } else {
                      appSnackBar(message: res.message.toString());
                    }
                  } else {
                    appSnackBar(
                        message: 'Please fill up all input fields');
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,),
                child:  Text(
                  'Login',
                  style:  TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              )),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Don\'t have an account? ',
                style: TextStyle(color: Colors.white),
              ),
              InkWell(
                onTap: () {
                  Get.offNamed(AppPages.register);
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text('Register',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(.8),
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppDimens.pagePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .padding
                    .top + 20,
              ),
              _topSection(),
              const SizedBox(
                height: 60,
              ),
              _bottomSection(context)
            ],
          ),
        ),
      ),
    );
  }
}
