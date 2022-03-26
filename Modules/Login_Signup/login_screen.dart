// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, non_constant_identifier_names, curly_braces_in_flow_control_structures, unused_element, no_logic_in_create_state, avoid_print, avoid_unnecessary_containers, unused_import, unused_local_variable, unnecessary_new, duplicate_ignore, file_names, unused_field, sized_box_for_whitespace, avoid_types_as_parameter_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_version_15_march/Modules/Home_Pages/homePage.dart';
import 'package:new_version_15_march/Modules/Login_Signup/Sign_Up.dart';
import 'package:new_version_15_march/Shared/UI/Drawer/custom_drawer.dart';
import 'package:new_version_15_march/Shared/local/cache_helper.dart';
import 'package:new_version_15_march/models/auth_models/login_model.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

//AeAe111@
//111111@gmail.com
class _LoginScreenState extends State<LoginScreen> {
  var emailcontroller = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;
  LoginModel? loginModel;
  var passwordController = TextEditingController();

  Future<void> login() async {
    var loginData = {
      'email': emailcontroller.text,
      'password': passwordController.text
    };
    await http.post(
        Uri.parse('http://courses-apps.herokuapp.com/public/api/login'),
        body: loginData,
        headers: {'Accept': 'application/json'}).then((value) {
      print(value.body.toString());
      setState(() {
        loginModel = LoginModel.fromJson(jsonDecode(value.body));
      });
      print(loginModel!.data!.email.toString());
    }).catchError((e) {
      print(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                  SizedBox(
                    height: 60,
                    width: 200,
                  ),
                  Center(
                    child: Container(
                      height: 200,
                      width: 400,
                      alignment: Alignment.center,
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                        // textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    width: 10,
                  ),
                  Container(
                    height: 140,
                    width: 530,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.grey[200],
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          onEditingComplete: () =>
                              FocusScope.of(context).nextFocus(),
                          controller: emailcontroller,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'E-Mail',
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.pink,
                            ),
                            contentPadding: EdgeInsets.all(20),
                          ),
                          validator: (Value) {
                            return 'E-Mail Must Not be Empty';
                          },
                        ),
                        Divider(
                          thickness: 3,
                          endIndent: 30,
                          indent: 30,
                        ),
                        TextFormField(
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: isPassword,
                          validator: (Value) {
                            return 'Password Is Too Short';
                          },
                          decoration: InputDecoration(
                            hintText: 'password',
                            prefixIcon: Icon(
                              Icons.password,
                              color: Colors.pink,
                            ),
                            suffixIcon: InkWell(
                              child: Icon(
                                isPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onTap: () {
                                setState(() {
                                  isPassword = !isPassword;
                                });
                              },
                            ),
                            contentPadding: EdgeInsets.all(20),
                            border: InputBorder.none,
                          ),
                        ),
                      ],
                    ),
                  ),
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
                        await login().then((value) {
                          if (loginModel!.data!.token != null) {
                            CacheHelper.putData(
                                    key: 'token',
                                    value: loginModel!.data!.token!)
                                .then((value) {
                              if (value) {
                                print(CacheHelper.getData(key: 'token'));
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()),
                                    (route) => false);
                              }
                            });
                          }
                        }).catchError((e) {
                          Fluttertoast.showToast(
                              msg: loginModel!.msg.toString(),
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        });
                      },
                      child: Text(
                        'LOG-IN',
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
                        'Don\'t have an account?',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => SignUp()),
                            (route) => false,
                          );
                        },
                        child: Text(
                          'Register Now',
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
