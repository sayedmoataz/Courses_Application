// ignore_for_file: unnecessary_new, unnecessary_this, prefer_collection_literals, prefer_typing_uninitialized_variables

class ProfileModel {
  bool? status;
  int? code;
  String? msg;
  Data? data;

  ProfileModel.fromJson(Map<String, dynamic> json) {
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
  List<StudentCourses> studentCourses=[];


  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    if (json['student_courses'] != null) {
      json['student_courses'].forEach((v) {
        studentCourses.add(new StudentCourses.fromJson(v));
      });
    }
  }

}

class StudentCourses {
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
  Pivot? pivot;
  Instructor? instructor;
  Subject? subject;


  StudentCourses.fromJson(Map<String, dynamic> json) {
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
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
    instructor = json['instructor'] != null
        ? new Instructor.fromJson(json['instructor'])
        : null;
    subject =
    json['subject'] != null ? new Subject.fromJson(json['subject']) : null;
  }

}

class Pivot {
  int? userId;
  int? courseId;


  Pivot.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    courseId = json['course_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['course_id'] = this.courseId;
    return data;
  }
}

class Instructor {
  int? id;
  String? name;
  String? email;
  String? photo;


  Instructor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    photo = json['photo'];
  }

}

class Subject {
  int? id;
  String? name;
  String? photo;


  Subject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
  }

}