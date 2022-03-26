
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
//import 'package:my_test_shop/shared/cubit/login_cubit/login_cubit.dart';

// ignore: non_constant_identifier_names
Widget CustomTextField(
    { required String hint,
      required IconData icon,
      required String  validatorT,
      bool? visable,

      required TextInputType type,
      TextEditingController? controller,

      VoidCallback? onClick,

      IconData? passIcon,
    }
    ){
  return
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        controller: controller,
        keyboardType: type,


        validator: (value) {

          if (value!.isEmpty) {
            return validatorT;
            // ignore: missing_return
          }
        },

        // obscureText: hint == 'password' ? true : false,

        obscureText:visable! ,
        decoration: InputDecoration(
          hintText: hint,


          suffixIcon: IconButton(
            onPressed: onClick,
            icon: Icon(
                passIcon,
                color: Colors.lightBlueAccent
            ),
          ),

          prefixIcon: Icon(
              icon,
              color: Colors.lightBlueAccent
          ),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white)),
        ),
      ),
    );


}

