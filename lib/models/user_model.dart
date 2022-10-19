
class UserModel {
  UserModel({
      String? id, 
      String? address, 
      int? quota, 
      int? used, 
      bool? isDisabled, 
      bool? isDeleted, 
      String? createdAt, 
      String? hydraDescription,
      String? updatedAt,}){
    _id = id;
    _address = address;
    _quota = quota;
    _used = used;
    _isDisabled = isDisabled;
    _isDeleted = isDeleted;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _hydraDescription = hydraDescription;
}

  UserModel.fromJson(dynamic json) {
    _id = json['id'];
    _address = json['address'];
    _quota = json['quota'];
    _used = json['used'];
    _isDisabled = json['isDisabled'];
    _isDeleted = json['isDeleted'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _hydraDescription = json['hydra:description']; //hydra:description
  }
  String? _id;
  String? _address;
  int? _quota;
  int? _used;
  bool? _isDisabled;
  bool? _isDeleted;
  String? _createdAt;
  String? _updatedAt;
  String? _hydraDescription;

UserModel copyWith({  String? id,
  String? address,
  int? quota,
  int? used,
  bool? isDisabled,
  bool? isDeleted,
  String? createdAt,
  String? hydraDescription,
  String? updatedAt,
}) => UserModel(  id: id ?? _id,
  address: address ?? _address,
  quota: quota ?? _quota,
  used: used ?? _used,
  isDisabled: isDisabled ?? _isDisabled,
  isDeleted: isDeleted ?? _isDeleted,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  hydraDescription: hydraDescription ?? _hydraDescription,
);
  String? get id => _id;
  String? get address => _address;
  int? get quota => _quota;
  int? get used => _used;
  bool? get isDisabled => _isDisabled;
  bool? get isDeleted => _isDeleted;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get hydraDescription => _hydraDescription;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['address'] = _address;
    map['quota'] = _quota;
    map['used'] = _used;
    map['isDisabled'] = _isDisabled;
    map['isDeleted'] = _isDeleted;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['hydra:description'] = _hydraDescription;
    return map;
  }

}