
class LoginModel {
  LoginModel({
      int? code, 
      String? message, 
      String? token, 
      String? id,}){
    _code = code;
    _message = message;
    _token = token;
    _id = id;
}

  LoginModel.fromJson(dynamic json) {
    _code = json['code'];
    _message = json['message'];
    _token = json['token'];
    _id = json['id'];
  }
  int? _code;
  String? _message;
  String? _token;
  String? _id;
LoginModel copyWith({  int? code,
  String? message,
  String? token,
  String? id,
}) => LoginModel(  code: code ?? _code,
  message: message ?? _message,
  token: token ?? _token,
  id: id ?? _id,
);
  int? get code => _code;
  String? get message => _message;
  String? get token => _token;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['message'] = _message;
    map['token'] = _token;
    map['id'] = _id;
    return map;
  }

}