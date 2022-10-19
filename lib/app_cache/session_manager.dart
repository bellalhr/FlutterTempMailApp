
import 'package:mail_tm_demo/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future storeUserGeneralInfo(
    {required String token,
      required bool status,
      required String userId,
      required String userName,}) async {
  final sharedPreferences = await SharedPreferences.getInstance();

  await sharedPreferences.setBool(SessionManagerKeys.loggedKey, status);
  await sharedPreferences.setString(SessionManagerKeys.userTokenKey, token);
  await sharedPreferences.setString(SessionManagerKeys.userIdKey, userId);
  await sharedPreferences.setString(SessionManagerKeys.userNameKey, userName);

}

Future<String?> getStrValueFromSharedPref(String key) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  var value = sharedPreferences.getString(key);
  return value;

}
Future<bool> setStrValueFromSharedPref(String key,String value) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  return await sharedPreferences.setString(key, value);
}

Future<bool> updateLoginStatus(bool status) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  return await sharedPreferences.setBool(SessionManagerKeys.loggedKey, status);
}

Future<bool> isLogin() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  var value = sharedPreferences.getBool(SessionManagerKeys.loggedKey);
  if (value == null || value == false) {
    return false;
  } else {
    return true;
  }
}


