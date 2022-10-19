/// hydraMember : [{"id":"630a547798095aea322cd3d6","domain":"emergentvillage.org","isActive":true,"isPrivate":false,"createdAt":"2022-08-27T00:00:00+00:00","updatedAt":"2022-08-27T00:00:00+00:00"}]
/// hydraTotalItems : 1

class DomainListModel {
  DomainListModel({
      List<HydraMember>? hydraMember, 
      int? hydraTotalItems,}){
    _hydraMember = hydraMember;
    _hydraTotalItems = hydraTotalItems;
}

  DomainListModel.fromJson(dynamic json) {
    if (json['hydra:member'] != null) {
      _hydraMember = [];
      json['hydra:member'].forEach((v) {
        _hydraMember?.add(HydraMember.fromJson(v));
      });
    }
    _hydraTotalItems = json['hydra:totalItems'];
  }
  List<HydraMember>? _hydraMember;
  int? _hydraTotalItems;
DomainListModel copyWith({  List<HydraMember>? hydraMember,
  int? hydraTotalItems,
}) => DomainListModel(  hydraMember: hydraMember ?? _hydraMember,
  hydraTotalItems: hydraTotalItems ?? _hydraTotalItems,
);
  List<HydraMember>? get hydraMember => _hydraMember;
  int? get hydraTotalItems => _hydraTotalItems;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_hydraMember != null) {
      map['hydra:member'] = _hydraMember?.map((v) => v.toJson()).toList();
    }
    map['hydra:totalItems'] = _hydraTotalItems;
    return map;
  }

}



class HydraMember {
  HydraMember({
      String? id, 
      String? domain, 
      bool? isActive, 
      bool? isPrivate, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _domain = domain;
    _isActive = isActive;
    _isPrivate = isPrivate;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  HydraMember.fromJson(dynamic json) {
    _id = json['id'];
    _domain = json['domain'];
    _isActive = json['isActive'];
    _isPrivate = json['isPrivate'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  String? _id;
  String? _domain;
  bool? _isActive;
  bool? _isPrivate;
  String? _createdAt;
  String? _updatedAt;
HydraMember copyWith({  String? id,
  String? domain,
  bool? isActive,
  bool? isPrivate,
  String? createdAt,
  String? updatedAt,
}) => HydraMember(  id: id ?? _id,
  domain: domain ?? _domain,
  isActive: isActive ?? _isActive,
  isPrivate: isPrivate ?? _isPrivate,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  String? get id => _id;
  String? get domain => _domain;
  bool? get isActive => _isActive;
  bool? get isPrivate => _isPrivate;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['domain'] = _domain;
    map['isActive'] = _isActive;
    map['isPrivate'] = _isPrivate;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}