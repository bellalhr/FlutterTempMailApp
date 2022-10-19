import 'package:get/get.dart';
import 'package:mail_tm_demo/controllers/login_controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }

}