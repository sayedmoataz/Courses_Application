// ignore_for_file: prefer_typing_uninitialized_variables, unnecessary_new

class ValidateModel {
  bool? status;
  int? code;
  String? msg;
  Data? data;


  ValidateModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

}

class Data {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? photo;
  String? university;
  var emailVerifiedAt;
  bool? active;
  int? type;
  var  deletedAt;
  String? createdAt;
  String? updatedAt;
  String? token;



  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    photo = json['photo'];
    university = json['university'];
    emailVerifiedAt = json['email_verified_at'];
    active = json['active'];
    type = json['type'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    token = json['token'];
  }

}