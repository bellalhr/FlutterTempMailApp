import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mail_tm_demo/app_cache/session_manager.dart';
import 'package:mail_tm_demo/app_routes/app_pages.dart';
import 'package:mail_tm_demo/controllers/home_controller.dart';
import 'package:mail_tm_demo/dependencies/home_binding.dart';
import 'package:mail_tm_demo/dependencies/login_binding.dart';
import 'package:mail_tm_demo/dependencies/register_binding.dart';
import 'package:mail_tm_demo/utils/app_colors.dart';
import 'package:mail_tm_demo/utils/app_constants.dart';
import 'package:mail_tm_demo/views/home_view.dart';
import 'package:mail_tm_demo/views/login_view.dart';
import 'package:mail_tm_demo/views/register_view.dart';

bool isLogged=false;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  ///Get user login status from local storage
  isLogged=await isLogin();
  ///launch myApp after get login user status
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppInfo.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColors.primaryColor,
        textTheme: GoogleFonts.latoTextTheme()
      ),
      initialRoute: isLogged?AppPages.home:AppPages.login,
      getPages: [
        GetPage(name: AppPages.home, page: () => HomeView(), binding: HomeBinding()),
        GetPage(name: AppPages.login, page: () => LoginView(), binding: LoginBinding()),
        GetPage(name: AppPages.register, page: () => RegisterView(), binding: RegisterBinding()),
      ],

    );
  }
}

