// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mail_tm_demo/controllers/register_controller.dart';
import 'package:mail_tm_demo/custom_widgets/app_text_field.dart';
import 'package:mail_tm_demo/custom_widgets/loader.dart';
import 'package:mail_tm_demo/utils/app_colors.dart';
import 'package:mail_tm_demo/utils/app_dimens.dart';
import 'package:mail_tm_demo/utils/helpers.dart';

import '../app_routes/app_pages.dart';

class RegisterView extends GetView<RegisterController> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

   RegisterView({Key? key}) : super(key: key);

  _topSection(){
    return Column(
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
                    text: '\nYour credentials for register.',
                    style: TextStyle(
                        height: 3,
                        color: Colors.white.withOpacity(.8),
                        letterSpacing: 2)),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 60,
        ),
      ],
    );
  }

  _bottomSection(BuildContext context){
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.textFieldFillColor,
              border: Border.all(
                  width: 1, color: Colors.white.withOpacity(.5))),
          child: Row(
            children: [
              Expanded(
                child: AppTextField(
                  labelName: 'Enter username',
                  controller: _emailController,
                  enableBorder: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Obx(() =>
                    SelectableText(
                      controller.domainName.value,
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ],
          ),
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
                  var res=await controller.registerNewUser(
                      address: _emailController.text +
                          controller.domainName.toString(),
                      password: _passController.text);
                  Navigator.pop(context);
                  if(res.hydraDescription==null)
                  {
                    appSnackBar(message: 'Your account has been created successfully',statusCode: AppStatusCode.success);
                    Get.offNamed(AppPages.login);
                  }else{
                    appSnackBar(message: res.hydraDescription.toString());
                  }


                } else {
                  appSnackBar(message: 'Please fill up all input fields');
                }
                /* Navigator.of(context).push(Loader());
                        await controller.fetchDomainList();
                        Navigator.pop(context);*/
              },
              style: ElevatedButton.styleFrom(primary: Colors.white),
              child: Text(
                'Register',
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
            )),
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Already have an account? ',
              style: TextStyle(color: Colors.white),
            ),
            InkWell(
              onTap: () {
                Get.offNamed(AppPages.login);
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text('Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(.8),
                    )),
              ),
            ),
          ],
        ),
      ],
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

              _bottomSection(context)
            ],
          ),
        ),
      ),
    );
  }
}
