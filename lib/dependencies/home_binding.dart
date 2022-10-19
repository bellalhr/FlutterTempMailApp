import 'package:get/get.dart';
import 'package:mail_tm_demo/controllers/home_controller.dart';
import 'package:mail_tm_demo/controllers/login_controller.dart';
import 'package:mail_tm_demo/controllers/register_controller.dart';


class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }

}