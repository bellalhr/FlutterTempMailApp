class AppInfo{
  static String appName='Mail TM Demo';
  static String appVersion='0.0.1';
  static String appVersionCode='1';
}


class WebServiceUrl{
  static const baseUrl = 'https://api.mail.tm/';
  static const login = '${baseUrl}token';
  static const register = '${baseUrl}accounts';
  static const messagesList = '${baseUrl}messages?';
  static const domainList = '${baseUrl}domains?';

}

class GlobalRef{
  static String domainNameGlobalRef='';
}

class SessionManagerKeys {
  static const String loggedKey = 'logged_key';
  static const String userTokenKey = 'userTokenKey';
  static const String userIdKey = 'userIdKey';
  static const String userNameKey = 'userNameKey';
}