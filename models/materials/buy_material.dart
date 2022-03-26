class BuyMaterialModel {
  bool? status;
  int? code;
  String? msg;


  BuyMaterialModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    msg = json['msg'];
  }

}