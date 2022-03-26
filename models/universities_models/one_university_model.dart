// ignore_for_file: unnecessary_new

class OneUniversityModel {
  bool? status;
  int? code;
  String? msg;
  Data? data;


  OneUniversityModel.fromJson(Map<String, dynamic> json) {
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
  List<Colleges> colleges=[];

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
    if (json['colleges'] != null) {
      json['colleges'].forEach((v) {
        colleges.add(new Colleges.fromJson(v));
      });
    }
  }

}

class Colleges {
  int? id;
  String? name;
  int? universityId;
  String? photo;
  List<Levels> levels=[];

  Colleges.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    universityId = json['university_id'];
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


  Levels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    collegeId = json['college_id'];
  }

}