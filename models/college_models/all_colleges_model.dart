class AllCollegesModel {
  bool? status;
  int? code;
  String? msg;
  List<Data> data=[];


  AllCollegesModel.fromJson(Map<String, dynamic> json) {
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
  String? photo;
  List<Levels> levels=[];


  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
    if (json['levels'] != null) {
      json['levels'].forEach((v) {
        levels.add( Levels.fromJson(v));
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