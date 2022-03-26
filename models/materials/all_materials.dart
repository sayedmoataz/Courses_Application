// ignore_for_file: unnecessary_new, unnecessary_this, prefer_typing_uninitialized_variables, prefer_collection_literals

class AllMaterialsModel {
  bool? status;
  int? code;
  String? msg;
  List<Data> data=[];

  AllMaterialsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    msg = json['msg'];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add( Data.fromJson(v));
      });
    }
  }


}

class Data {
  int? id;
  String? name;
  String? video;
  String? file;
  String? description;
  String? price;
  bool? active;
  int? courseId;
  var deletedAt;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;



  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    video = json['video'];
    file = json['file'];
    description = json['description'];
    price = json['price'];
    active = json['active'];
    courseId = json['course_id'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }


}

class Pivot {
  int? userId;
  int? materialId;

  Pivot({this.userId, this.materialId});

  Pivot.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    materialId = json['material_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['material_id'] = this.materialId;
    return data;
  }
}