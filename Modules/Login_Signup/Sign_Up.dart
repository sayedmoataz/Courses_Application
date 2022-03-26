// ignore_for_file: file_names, prefer_const_constructors, prefer_typing_uninitialized_variables, sized_box_for_whitespace, avoid_print, unused_import, prefer_const_constructors_in_immutables, unnecessary_null_comparison

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:new_version_15_march/Modules/Home_Pages/homePage.dart';
import 'package:new_version_15_march/Modules/Login_Signup/login_screen.dart';
import 'package:new_version_15_march/Modules/Login_Signup/verification.dart';
import 'package:new_version_15_march/Shared/local/cache_helper.dart';
import 'package:new_version_15_march/models/auth_models/register_model.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var passwordController_1 = TextEditingController();
  bool isPassword_1 = true;
  var passwordController_2 = TextEditingController();
  bool isPassword_2 = true;
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  RegisterModel? registerModel;
  var errorRegister;

  Future<void> register() async {
    var formData = {
      "name": nameController.text,
      "email": emailController.text,
      "password": passwordController_1.text,
      "confirm_password": passwordController_2.text,
      "phone": phoneController.text,
    };
    var uri = Uri.parse('http://courses-apps.herokuapp.com/public/api/student');
    await http.post(uri,
        body: formData, headers: {"Accept": "application/json"}).then((value) {
      print(value.body.toString());
      setState(() {
        if (jsonDecode(value.body)['message'] ==
            'The given data was invalid.') {
          errorRegister = jsonDecode(value.body);
        } else {
          registerModel = RegisterModel.fromJson(jsonDecode(value.body));
        }
      });
      print(value.toString());
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
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      height: 200,
                      width: 400,
                      alignment: Alignment.center,
                      child: Text(
                        "Sign-Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    width: 10,
                  ),
                  Container(
                      height: 360,
                      width: 530,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.grey[200],
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            TextFormField(
                              onEditingComplete: () =>
                                  FocusScope.of(context).nextFocus(),
                              controller: nameController,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                hintText: 'Your Name Here',
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.pink,
                                ),
                                contentPadding: EdgeInsets.all(20),
                              ),
                            ),
                            Divider(
                              thickness: 3,
                              endIndent: 30,
                              indent: 30,
                            ),
                            TextFormField(
                              onEditingComplete: () =>
                                  FocusScope.of(context).nextFocus(),
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'E-Mail',
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: Colors.pink,
                                ),
                                contentPadding: EdgeInsets.all(20),
                                border: InputBorder.none,
                              ),
                            ),
                            Divider(
                              thickness: 3,
                              endIndent: 30,
                              indent: 30,
                            ),
                            TextFormField(
                              onEditingComplete: () =>
                                  FocusScope.of(context).nextFocus(),
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                hintText: 'Mobile Number',
                                prefixIcon: Icon(
                                  Icons.mobile_friendly,
                                  color: Colors.pink,
                                ),
                                contentPadding: EdgeInsets.all(20),
                                border: InputBorder.none,
                              ),
                            ),
                            Divider(
                              thickness: 3,
                              endIndent: 30,
                              indent: 30,
                            ),
                            TextFormField(
                              onEditingComplete: () =>
                                  FocusScope.of(context).nextFocus(),
                              controller: passwordController_1,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: isPassword_1,
                              decoration: InputDecoration(
                                hintText: 'password',
                                prefixIcon: Icon(
                                  Icons.password,
                                  color: Colors.pink,
                                ),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isPassword_1 = !isPassword_1;
                                    });
                                  },
                                  child: Icon(
                                    isPassword_1
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                ),
                                contentPadding: EdgeInsets.all(20),
                                border: InputBorder.none,
                              ),
                            ),
                            Divider(
                              thickness: 3,
                              endIndent: 30,
                              indent: 30,
                            ),
                            TextFormField(
                              onEditingComplete: () =>
                                  FocusScope.of(context).nextFocus(),
                              controller: passwordController_2,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: isPassword_2,
                              decoration: InputDecoration(
                                hintText: ' Confirm password',
                                prefixIcon: Icon(
                                  Icons.password,
                                  color: Colors.pink,
                                ),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isPassword_2 = !isPassword_2;
                                    });
                                  },
                                  child: Icon(
                                    isPassword_2
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                ),
                                contentPadding: EdgeInsets.all(20),
                                border: InputBorder.none,
                              ),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50.0,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: Colors.pink,
                      onPressed: () async {
                        await register().then((value) {
                          if (registerModel!.token != null) {
                            CacheHelper.putData(
                                    key: 'token', value: registerModel!.token)
                                .then((value) {
                              if (value) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Verification()),
                                    (route) => false);
                              }
                            });
                          }
                        }).catchError((e) {
                          Fluttertoast.showToast(
                              msg: errorRegister['errors'].toString(),
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        });
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                            (route) => false,
                          );
                        },
                        child: Text(
                          'Login Now',
                          style: TextStyle(
                            color: Colors.pinkAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
