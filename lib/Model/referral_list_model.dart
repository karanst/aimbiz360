/// error : false
/// message : "Data Succesfully Show"
/// data : [{"id":"4","user_id":"207","name":"Ajay ","mobile":"2147483647","share_info":"1","category_id":"1","assign_to":"0","status":"New Lead","created_at":"2023-04-21 14:51:23","update_at":"2023-04-21 14:51:23","product":"Credit Card"},{"id":"5","user_id":"207","name":"Harish ","mobile":"2147483647","share_info":"0","category_id":"5","assign_to":"0","status":"New Lead","created_at":"2023-04-21 14:53:24","update_at":"2023-04-21 14:53:24","product":"Credit Line Card"}]

class ReferralListModel {
  ReferralListModel({
      bool? error, 
      String? message, 
      List<ReferList>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  ReferralListModel.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(ReferList.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<ReferList>? _data;
ReferralListModel copyWith({  bool? error,
  String? message,
  List<ReferList>? data,
}) => ReferralListModel(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<ReferList>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "4"
/// user_id : "207"
/// name : "Ajay "
/// mobile : "2147483647"
/// share_info : "1"
/// category_id : "1"
/// assign_to : "0"
/// status : "New Lead"
/// created_at : "2023-04-21 14:51:23"
/// update_at : "2023-04-21 14:51:23"
/// product : "Credit Card"

class ReferList {
  ReferList({
      String? id, 
      String? userId, 
      String? name, 
      String? mobile, 
      String? shareInfo, 
      String? categoryId, 
      String? assignTo, 
      String? status, 
      String? createdAt, 
      String? updateAt, 
      String? product,}){
    _id = id;
    _userId = userId;
    _name = name;
    _mobile = mobile;
    _shareInfo = shareInfo;
    _categoryId = categoryId;
    _assignTo = assignTo;
    _status = status;
    _createdAt = createdAt;
    _updateAt = updateAt;
    _product = product;
}

  ReferList.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _name = json['name'];
    _mobile = json['mobile'];
    _shareInfo = json['share_info'];
    _categoryId = json['category_id'];
    _assignTo = json['assign_to'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updateAt = json['update_at'];
    _product = json['product'];
  }
  String? _id;
  String? _userId;
  String? _name;
  String? _mobile;
  String? _shareInfo;
  String? _categoryId;
  String? _assignTo;
  String? _status;
  String? _createdAt;
  String? _updateAt;
  String? _product;
ReferList copyWith({  String? id,
  String? userId,
  String? name,
  String? mobile,
  String? shareInfo,
  String? categoryId,
  String? assignTo,
  String? status,
  String? createdAt,
  String? updateAt,
  String? product,
}) => ReferList(  id: id ?? _id,
  userId: userId ?? _userId,
  name: name ?? _name,
  mobile: mobile ?? _mobile,
  shareInfo: shareInfo ?? _shareInfo,
  categoryId: categoryId ?? _categoryId,
  assignTo: assignTo ?? _assignTo,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updateAt: updateAt ?? _updateAt,
  product: product ?? _product,
);
  String? get id => _id;
  String? get userId => _userId;
  String? get name => _name;
  String? get mobile => _mobile;
  String? get shareInfo => _shareInfo;
  String? get categoryId => _categoryId;
  String? get assignTo => _assignTo;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updateAt => _updateAt;
  String? get product => _product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['name'] = _name;
    map['mobile'] = _mobile;
    map['share_info'] = _shareInfo;
    map['category_id'] = _categoryId;
    map['assign_to'] = _assignTo;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['update_at'] = _updateAt;
    map['product'] = _product;
    return map;
  }

}