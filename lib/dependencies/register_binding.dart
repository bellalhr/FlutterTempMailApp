import 'package:get/get.dart';
import 'package:mail_tm_demo/controllers/register_controller.dart';

class RegisterBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }

}