import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:mail_tm_demo/models/domain_list_model.dart';
import 'package:mail_tm_demo/models/user_model.dart';
import 'package:mail_tm_demo/utils/app_constants.dart';
import 'package:mail_tm_demo/utils/app_logs.dart';
import 'package:mail_tm_demo/utils/app_strings.dart';

class RegisterController extends GetxController{
  var count=5.obs;
  var domainName=''.obs;


  @override
  void onInit() {
    super.onInit();

    ///fetch valid domain list form server
    fetchDomainList();
  }
  @override
  void onClose() {

    super.onClose();
  }


  fetchDomainList()async{
    if(GlobalRef.domainNameGlobalRef.isEmpty) {
      var response = await get(Uri.parse(WebServiceUrl.domainList));
      var model = DomainListModel.fromJson(json.decode(response.body));

      if (model.hydraMember != null) {
        domainName.value = '@${model.hydraMember![0].domain.toString()}';
        GlobalRef.domainNameGlobalRef = '@${model.hydraMember![0].domain.toString()}';
        AppLogs.logD(GlobalRef.domainNameGlobalRef);
      }
    }else{
      domainName.value = GlobalRef.domainNameGlobalRef;
      AppLogs.logD(domainName.value);
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





  Future<UserModel> registerNewUser({required String address,required String password})async{

    Map<String, String> headers = {
      "Content-Type": "application/json"
    };
    try {
      var response = await post(Uri.parse(WebServiceUrl.register),
          body: json.encode({"address": address,'password':password}),headers: headers);
      AppLogs.logD('errorMsgBody=>${response.body}');
      return UserModel.fromJson(json.decode(response.body));
    } catch (e) {
      AppLogs.logD('errorMsg=>${e.toString()}');
      return UserModel(hydraDescription: AppStrings.serverError);
    }
  }
}