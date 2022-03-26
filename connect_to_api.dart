// ignore_for_file: avoid_print, prefer_const_constructors, non_constant_identifier_names

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:new_version_15_march/models/auth_models/login_model.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:new_version_15_march/models/auth_models/register_model.dart';
import 'package:new_version_15_march/models/auth_models/validation_model.dart';
import 'package:new_version_15_march/models/college_models/all_colleges_model.dart';
import 'package:new_version_15_march/models/college_models/one_college_model.dart';
import 'package:new_version_15_march/models/courses_models/all_courses.dart';
import 'package:new_version_15_march/models/courses_models/buy_course_model.dart';
import 'package:new_version_15_march/models/courses_models/course_review.dart';
import 'package:new_version_15_march/models/courses_models/one_course.dart';
import 'package:new_version_15_march/models/courses_models/store_messege.dart';
import 'package:new_version_15_march/models/materials/add_material_favorites_model.dart';
import 'package:new_version_15_march/models/materials/all_materials.dart';
import 'package:new_version_15_march/models/materials/buy_material.dart';
import 'package:new_version_15_march/models/materials/delete_material_favorites.dart';
import 'package:new_version_15_march/models/materials/favorite_materials_model.dart';
import 'package:new_version_15_march/models/materials/one_material_model.dart';
import 'package:new_version_15_march/models/universities_models/all_universities.dart';
import 'package:new_version_15_march/models/universities_models/one_university_model.dart';
import 'package:new_version_15_march/models/user_models/profile_model.dart';


class ConnectApi extends StatefulWidget {
  const ConnectApi({Key? key}) : super(key: key);

  @override
  State<ConnectApi> createState() => _ConnectApiState();
}

class _ConnectApiState extends State<ConnectApi> {
  String token='35|8pdJGsVUXEspxBaR84Tlcqk97WmDoV6asxX970E0';



  //register
  RegisterModel? registerModel;
  Future<void> register()async{

    var formData =  {
      "email":"m7bvfng@gmail.com",
      "password":"11Af54121@",
      "photo": '',
      "name":"mohamed",
      "phone":"01590912012",
      "university":"university",
      "confirm_password":"11Af54121@"
    };
    var uri=Uri.parse('http://courses-apps.herokuapp.com/public/api/student');
    await http.post(uri,body: formData,headers: {"Accept":"application/json"})
        .then((value) {
      print(value.body.toString());
      setState(() {
        registerModel = RegisterModel.fromJson(jsonDecode(value.body));

      });
      print(value.toString());
    }).catchError((e){
      print(e.toString());
    });

  }

  ProfileModel? profileModel;
  Future<void>getProfileData()async{
    var uri=Uri.parse('http://courses-apps.herokuapp.com/public/api/profile');
    await http.get(uri,headers: {'Authorization':'Bearer $token',"Accept":"application/json"}).then((value) {
      print(value.body.toString());
      setState(() {
        profileModel=ProfileModel.fromJson(jsonDecode(value.body));

      });
      print(profileModel!.data!.name);
    }).catchError((e){
      print(e.toString());
    });
  }




//Login
  LoginModel? loginModel;
  Future<void> login()async{
    var loginData={
      'email':'111111@gmail.com',
      'password':'AeAe111@'
    };
    await http.post(Uri.parse('http://courses-apps.herokuapp.com/public/api/login'),body: loginData,headers: {'Accept':'application/json'})
        .then((value) {print(value.body.toString());
          setState(() {
            loginModel = LoginModel.fromJson(jsonDecode(value.body));

          });
    print(loginModel!.data!.email.toString());
    }).catchError((e){
      print(e.toString());
    });

  }


ValidateModel? validateModel;
  Future<void> Validate()async{
    var loginData={
      'code':'',
      'email':''
    };
    await http.post(Uri.parse('http://courses-apps.herokuapp.com/public/api/email/verify'),body: loginData,headers: {'Accept':'application/json'})
        .then((value) {print(value.body.toString());
          setState(() {
            validateModel = ValidateModel.fromJson(jsonDecode(value.body));

          });
    print(validateModel!.msg.toString());
    }).catchError((e){
      print(e.toString());
    });

  }



















  //get all universities
  AllUniversitiesModel ?allUniversitiesModel;
  Future<void>getAllUniversities()async{
    var uri=Uri.parse('http://courses-apps.herokuapp.com/public/api/university');
    await http.get(uri,headers: {"Accept":"application/json"})

        .then((value){
          setState(() {
            allUniversitiesModel=AllUniversitiesModel.fromJson(jsonDecode(value.body));

          });
      print(allUniversitiesModel!.data[0].name);
    }).catchError((e){
      print(e.toString());
    });
  }


//one university

  OneUniversityModel ?oneUniversityModel;
  Future<void>getOneUniversity()async{
    var uri=Uri.parse('http://courses-apps.herokuapp.com/public/api/university/1');
    await http.get(uri,headers: {"Accept":"application/json"})

        .then((value){
          setState(() {
            oneUniversityModel=OneUniversityModel.fromJson(jsonDecode(value.body));

          });
      print(oneUniversityModel!.data!.colleges[0].levels[0].name);
    }).catchError((e){
      print(e.toString());
    });
  }


  //get all colleges
  AllCollegesModel ?allCollegesModel;
  Future<void>getAllColleges()async{
    var uri=Uri.parse('http://courses-apps.herokuapp.com/public/api/college');
    await http.get(uri,headers: {"Accept":"application/json"})

        .then((value){
          setState(() {
            allCollegesModel=AllCollegesModel.fromJson(jsonDecode(value.body));

          });
      print(allCollegesModel!.data[0].levels[0].name);
    }).catchError((e){
      print(e.toString());
    });
  }

 //getOneCollege
  OneCollegesModel ?oneCollegesModel;
  Future<void>getOneCollege()async{
    var uri=Uri.parse('http://courses-apps.herokuapp.com/public/api/college/1');
    await http.get(uri,headers: {"Accept":"application/json"})

        .then((value){
          setState(() {
            oneCollegesModel=OneCollegesModel.fromJson(jsonDecode(value.body));

          });
      print(oneCollegesModel!.data!.levels[0].subjects[0].photo);
    }).catchError((e){
      print(e.toString());
    });
  }





  //courses
//buy course
  BuyCourseModel ? buyCourseModel;
  Future<void>buyCourse()async{
    var data={
      'course_id':'1'
    };
    var uri=Uri.parse('http://courses-apps.herokuapp.com/public/api/payment');
    await http.post(uri,headers: {"Accept":"application/json",'Authorization':'Bearer $token'},body: data).then((value) {
     setState(() {
       buyCourseModel=BuyCourseModel.fromJson(jsonDecode(value.body));

     });
      print(buyCourseModel!.msg);
    }).catchError((e){
      print(e.toString());
    });
  }

//course review
  CourseReviewModel? courseReviewModel;
  Future<void>courseReview()async{
    var data={
      'course_id':'2',
      'rate':'5'
    };
    var uri=Uri.parse('http://courses-apps.herokuapp.com/public/api/rate/course');
    await http.post(uri,headers: {"Accept":"application/json",'Authorization':'Bearer $token'},body: data).then((value) {
      setState(() {
        courseReviewModel=CourseReviewModel.fromJson(jsonDecode(value.body));

      });
      print(courseReviewModel!.msg);
    }).catchError((e){
      print(e.toString());
    });
  }

  //course message

  StoreMessageModel? storeMessageModel;
  Future<void>storeMessage()async{
    var data={
      'course_id':'2',
      'message':'messagemessagemessage'
    };
    var uri=Uri.parse('http://courses-apps.herokuapp.com/public/api/chat');
    await http.post(uri,headers: {"Accept":"application/json",'Authorization':'Bearer $token'},body: data).then((value) {
      setState(() {
        storeMessageModel=StoreMessageModel.fromJson(jsonDecode(value.body));

      });
      print(storeMessageModel!.msg);
    }).catchError((e){
      print(e.toString());
    });
  }


  //one course
  OneCourseModel? oneCourseModel;
  Future<void>getOneCourse()async{
    var uri=Uri.parse('http://courses-apps.herokuapp.com/public/api/course/1');
    await http.get(uri,headers: {"Accept":"application/json",'Authorization':'Bearer $token'}).then((value) {
     setState(() {
       oneCourseModel=OneCourseModel.fromJson(jsonDecode(value.body));

     });
      print(oneCourseModel!.data!.instructor!.phone);
    }).catchError((e){
      print(e.toString());
    });
  }

  //all courses
  AllCoursesModel? allCoursesModel;
  Future<void>getAllCourses()async{
    var uri=Uri.parse('http://courses-apps.herokuapp.com/public/api/course');
    await http.get(uri,headers: {"Accept":"application/json",'Authorization':'Bearer $token'}).then((value) {
      setState(() {
        allCoursesModel=AllCoursesModel.fromJson(jsonDecode(value.body));

      });
      print(allCoursesModel!.data[0].materials[0].price);
    }).catchError((e){
      print(e.toString());
    });
  }











  //materials

  //get all materials
  AllMaterialsModel? allMaterialsModel;
  Future<void>getAllMaterials()async{
    var uri=Uri.parse('http://courses-apps.herokuapp.com/public/api/material');
    await http.get(uri,headers: {"Accept":"application/json",'Authorization':'Bearer $token'}).then((value) {
      setState(() {
        allMaterialsModel=AllMaterialsModel.fromJson(jsonDecode(value.body));

      });
      print(allCoursesModel!.data[0].materials);
    }).catchError((e){
      print(e.toString());
    });
  }

  //get favorite materials
  FavoritesModel? favoritesModel;
  Future<void>getFavoritesMaterials()async{
    var uri=Uri.parse('http://courses-apps.herokuapp.com/public/api/favorite-material');
    await http.get(uri,headers: {"Accept":"application/json",'Authorization':'Bearer $token'}).then((value) {
      setState(() {
        favoritesModel=FavoritesModel.fromJson(jsonDecode(value.body));

      });
      print(favoritesModel!.data[0].name);
    }).catchError((e){
      print(e.toString());
    });
  }
//get one material
  OneMaterialModel? oneMaterialModel;
  Future<void>getOneMaterial()async{
    var uri=Uri.parse('http://courses-apps.herokuapp.com/public/api/material/12');
    await http.get(uri,headers: {"Accept":"application/json",'Authorization':'Bearer $token'}).then((value) {
     setState(() {
       oneMaterialModel=OneMaterialModel.fromJson(jsonDecode(value.body));

     });
      print(oneMaterialModel!.msg);
    }).catchError((e){
      print(e.toString());
    });
  }
 //buy material
  BuyMaterialModel? buyMaterialModel;
  Future<void>buyMaterial()async{
    var data={
      'material_id':'2'
    };
    var uri=Uri.parse('http://courses-apps.herokuapp.com/public/api/material/buy');
    await http.post(uri,headers: {"Accept":"application/json",'Authorization':'Bearer $token'},body: data).then((value) {
      setState(() {
        buyMaterialModel=BuyMaterialModel.fromJson(jsonDecode(value.body));

      });
      print(buyMaterialModel!.msg);
    }).catchError((e){
      print(e.toString());
    });
  }
  //add material to fav

  AddMaterialFavoriteModel? addMaterialFavoriteModel;
  Future<void>addMaterialFavorite()async{
    var data={
      'material_id':'2'
    };
    var uri=Uri.parse('http://courses-apps.herokuapp.com/public/api/favorite-material');
    await http.post(uri,headers: {"Accept":"application/json",'Authorization':'Bearer $token'},body: data).then((value) {
      setState(() {
        addMaterialFavoriteModel=AddMaterialFavoriteModel.fromJson(jsonDecode(value.body));

      });
      print(addMaterialFavoriteModel!.msg);
    }).catchError((e){
      print(e.toString());
    });
  }

  //delete material from fav

  DeleteMaterialFavoriteModel? deleteMaterialFavoriteModel;
  Future<void>deleteMaterialFavorite()async{
    var data={
      'material_id':'2'
    };
    var uri=Uri.parse('http://courses-apps.herokuapp.com/public/api/favorite-material/2');
    await http.delete(uri,headers: {"Accept":"application/json",'Authorization':'Bearer $token'},body: data).then((value) {
      setState(() {
        deleteMaterialFavoriteModel=DeleteMaterialFavoriteModel.fromJson(jsonDecode(value.body));
      });
      print(deleteMaterialFavoriteModel!.msg);
    }).catchError((e){
      print(e.toString());
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff262626),

      body: Center(
        child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: (){
            getFavoritesMaterials();
          },
          child: Card(
            color: Colors.transparent,
            elevation: 40,
            child: BackdropFilter(
            filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
            child: Container(
              child:Text(
                'click here bro',
                style: TextStyle(color: Colors.white.withOpacity(.8),fontSize: 40),
              ),


            height: 300,
            width:300,
            alignment: Alignment.center,
            decoration: BoxDecoration(

            color: Colors.white.withOpacity(.05),
            borderRadius: BorderRadius.circular(15),
    ),

    )),
          ),
        )),
      ));
  }
}
