// ignore_for_file: unnecessary_new, prefer_typing_uninitialized_variables

class OneCourseModel {
  bool? status;
  int? code;
  String? msg;
  Data? data;


  OneCourseModel.fromJson(Map<String, dynamic> json) {
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
  int? price;
  int? realPrice;
  String? description;
  int? subjectId;
  int? instructorId;
  bool? active;
  var deletedAt;
  String? createdAt;
  String? updatedAt;
  int? rate;
  Pivot? pivot;
  List<Materials> materials=[];
  Instructor? instructor;
  List<Comments> comments=[];
  Subject? subject;
  List<Rates> rates=[];


  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
    price = json['price'];
    realPrice = json['real_price'];
    description = json['description'];
    subjectId = json['subject_id'];
    instructorId = json['instructor_id'];
    active = json['active'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    rate = json['rate'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
    if (json['materials'] != null) {
      json['materials'].forEach((v) {
        materials.add(new Materials.fromJson(v));
      });
    }
    instructor = json['instructor'] != null
        ? new Instructor.fromJson(json['instructor'])
        : null;
    if (json['comments'] != null) {
      json['comments'].forEach((v) {
        comments.add(new Comments.fromJson(v));
      });
    }
    subject =
    json['subject'] != null ? new Subject.fromJson(json['subject']) : null;
    if (json['rates'] != null) {
      json['rates'].forEach((v) {
        rates.add(new Rates.fromJson(v));
      });
    }
  }

}

class Pivot {
  int? userId;
  int? courseId;


  Pivot.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    courseId = json['course_id'];
  }

}

class Materials {
  int? courseId;
  int? id;
  String? name;
  String? video;
  String? file;
  String? description;
  String? price;


  Materials.fromJson(Map<String, dynamic> json) {
    courseId = json['course_id'];
    id = json['id'];
    name = json['name'];
    video = json['video'];
    file = json['file'];
    description = json['description'];
    price = json['price'];
  }

}

class Instructor {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? photo;


  Instructor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    photo = json['photo'];
  }

}

class Comments {
  int? id;
  int? courseId;
  String? message;
  String? type;
  int? userId;


  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseId = json['course_id'];
    message = json['message'];
    type = json['type'];
    userId = json['user_id'];
  }

}

class Subject {
  int? id;
  String? name;
  int? levelId;
  bool? active;
  String? photo;

  Subject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    levelId = json['level_id'];
    active = json['active'];
    photo = json['photo'];
  }

}

class Rates {
  int? id;
  int? rate;
  int? courseId;
  int? userId;
  String? createdAt;
  String? updatedAt;


  Rates.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rate = json['rate'];
    courseId = json['course_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}