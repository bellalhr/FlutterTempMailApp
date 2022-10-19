import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:mail_tm_demo/app_cache/session_manager.dart';
import 'package:mail_tm_demo/models/message_model.dart';
import 'package:mail_tm_demo/utils/app_constants.dart';
import 'package:mail_tm_demo/utils/app_logs.dart';
import 'package:mail_tm_demo/utils/app_strings.dart';
import 'package:mail_tm_demo/utils/helpers.dart';

class HomeController extends GetxController{
  var isLoading=false.obs;
  var userName=''.obs;
  var messageList = <HydraMemberMessage>[].obs;

  @override
  void onInit() {

    super.onInit();

    ///fetch username form local storage
    fetchUserName();

    ///fetch message list form server
    fetchMessageList();
  }
  @override
  void onClose() {

    super.onClose();
  }

  fetchUserName()async{
    userName.value=(await getStrValueFromSharedPref(SessionManagerKeys.userNameKey))!;
  }

  fetchMessageList({int pageNo=1})async{
    isLoading.value=true;
    var token =
    await getStrValueFromSharedPref(SessionManagerKeys.userTokenKey);
    Map<String, String> headers = {
      "Authorization": "$token",
    };
    var response = await get(Uri.parse(WebServiceUrl.messagesList+pageNo.toString()),headers: headers);
    try{
      var model = MessageModel.fromJson(json.decode(response.body));

      ///clear previous list
      messageList.clear();

      model.hydraMember?.forEach((element) {
        messageList.add(element);
      });
      AppLogs.logD('responseBody=>${response.body}');
      isLoading.value=false;
    }catch(e){
      AppLogs.logD('errorMsg=>${e.toString()}');
      isLoading.value=false;
      appSnackBar(message: AppStrings.serverError);
    }
  }
}