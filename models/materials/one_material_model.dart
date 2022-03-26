class OneMaterialModel {
  bool? status;
  int? code;
  String? msg;
  String? data;


  OneMaterialModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    msg = json['msg'];
    data = json['data'];
  }


}