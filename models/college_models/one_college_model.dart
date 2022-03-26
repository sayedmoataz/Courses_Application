// ignore_for_file: unnecessary_new, prefer_typing_uninitialized_variables

class OneCollegesModel {
  bool? status;
  int? code;
  String? msg;
  Data? data;

  OneCollegesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

}

class Data {
  int? id;
  String? name;
  String? photo;
  List<Levels> levels=[];


  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
    if (json['levels'] != null) {
      json['levels'].forEach((v) {
        levels.add(new Levels.fromJson(v));
      });
    }
  }

}

class Levels {
  int? id;
  String? name;
  int? collegeId;
  List<Subjects> subjects=[];

  Levels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    collegeId = json['college_id'];
    if (json['subjects'] != null) {
      json['subjects'].forEach((v) {
        subjects.add(new Subjects.fromJson(v));
      });
    }
  }
}

class Subjects {
  int? id;
  String? name;
  int? levelId;
  bool? active;
  String? photo;
  var deletedAt;
  String? createdAt;
  String? updatedAt;


  Subjects.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    levelId = json['level_id'];
    active = json['active'];
    photo = json['photo'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}