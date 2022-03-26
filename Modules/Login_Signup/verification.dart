// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables, prefer_const_constructors, unused_import, unused_field, sized_box_for_whitespace, non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_version_15_march/Shared/local/cache_helper.dart';
import 'package:new_version_15_march/models/auth_models/validation_model.dart';
import 'package:http/http.dart' as http;

class Verification extends StatefulWidget {
  Verification({Key? key}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  bool _onEditing = true;
  late String _code;

  ValidateModel? validateModel;
  Future<void> Validate() async {
    var loginData = {'code': _code, 'email': ''};
    await http.post(
        Uri.parse('http://courses-apps.herokuapp.com/public/api/email/verify'),
        body: loginData,
        headers: {'Accept': 'application/json'}).then((value) {
      print(value.body.toString());
      setState(() {
        validateModel = ValidateModel.fromJson(jsonDecode(value.body));
      });
      print(validateModel!.msg.toString());
    }).catchError((e) {
      print(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromRGBO(40, 38, 56, 1),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    height: 100,
                    width: 400,
                    alignment: Alignment.center,
                    child: Text(
                      "Verification Your Account",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Please Enter The OPT Code Sent To Your Mail",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                VerificationCode(
                  textStyle: TextStyle(fontSize: 20.0, color: Colors.red[900]),
                  keyboardType: TextInputType.number,
                  underlineColor: Colors.pink,
                  length: 6,
                  cursorColor: Colors.blue,
                  onCompleted: (String value) {
                    setState(() {
                      _code = value;
                    });
                  },
                  onEditing: (bool value) {
                    setState(() {
                      _onEditing = value;
                    });
                    if (!_onEditing) FocusScope.of(context).unfocus();
                  },
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  width: double.infinity,
                  height: 50.0,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: Colors.pink,
                    onPressed: () async {
                      await Validate().then((value) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Verification()),
                            (route) => false);
                      }).catchError((e) {
                        Fluttertoast.showToast(
                            msg: validateModel!.msg.toString(),
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      });
                    },
                    child: Text(
                      'Send Code',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
