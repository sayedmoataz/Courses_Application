// ignore_for_file: unused_import, avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart'as http;
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_version_15_march/cubit/states.dart';
import 'package:new_version_15_march/models/auth_models/login_model.dart';
import 'package:new_version_15_march/models/auth_models/register_model.dart';
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

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit() : super(HomeInitState());
  static HomeCubit get(contaxt) => BlocProvider.of(contaxt);
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
  emit(HomeRegisterLoadingState());
  var uri=Uri.parse('http://courses-apps.herokuapp.com/public/api/student');
  await http.post(uri,body: formData,headers: {"Accept":"application/json"})
        .then((value) {
    print(value.body.toString());
    registerModel = RegisterModel.fromJson(jsonDecode(value.body));
      print(value.toString());
      emit(HomeRegisterSuccessState());
    }).catchError((e){
       print(e.toString());
      emit(HomeRegisterErrorState());
    });

  }

  //get all universities
AllUniversitiesModel ?allUniversitiesModel;
Future<void>getAllUniversities()async{
    emit(HomeGetAllUniversitiesLoadingState());
    var uri=Uri.parse('http://courses-apps.herokuapp.com/public/api/university');
    await http.get(uri,headers: {"Accept":"application/json"})

        .then((value){
      allUniversitiesModel=AllUniversitiesModel.fromJson(jsonDecode(value.body));
      print(allUniversitiesModel!.data[0].name);
      emit(HomeGetAllUniversitiesSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(HomeGetAllUniversitiesErrorState());
    });
}


//one university

  OneUniversityModel ?oneUniversityModel;
  Future<void>getOneUniversity()async{
    emit(HomeGetOneUniversityLoadingState());
    var uri=Uri.parse('http://courses-apps.herokuapp.com/public/api/university/1');
    await http.get(uri,headers: {"Accept":"application/json"})

        .then((value){
      oneUniversityModel=OneUniversityModel.fromJson(jsonDecode(value.body));
      print(oneUniversityModel!.data!.colleges[0].levels[0].name);
      emit(HomeGetOneUniversitySuccessState());
    }).catchError((e){
      print(e.toString());
      emit(HomeGetOneUniversityErrorState());
    });
  }


  //get all colleges
  AllCollegesModel ?allCollegesModel;
  Future<void>getAllColleges()async{
    emit(HomeGetAllCollagesLoadingState());
    var uri=Uri.parse('http://courses-apps.herokuapp.com/public/api/college');
    await http.get(uri,headers: {"Accept":"application/json"})

        .then((value){
      allCollegesModel=AllCollegesModel.fromJson(jsonDecode(value.body));
      print(allCollegesModel!.data[0].levels[0].name);
      emit(HomeGetAllCollagesSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(HomeGetAllCollagesErrorState());
    });
  }

  //one university

  OneCollegesModel ?oneCollegesModel;
  Future<void>getOneCollege()async{
    emit(HomeGetOneCollegeLoadingState());
    var uri=Uri.parse('http://courses-apps.herokuapp.com/public/api/college/1');
    await http.get(uri,headers: {"Accept":"application/json"})

      .then((value){
      oneCollegesModel=OneCollegesModel.fromJson(jsonDecode(value.body));
      print(oneCollegesModel!.data!.levels[0].subjects[0].photo);
      emit(HomeGetOneCollegeSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(HomeGetOneCollegeErrorState());
    });
  }


 
  
  
  
  

ProfileModel? profileModel;
Future<void>getProfileData()async{
    emit(HomeGetProfileLoadingState());
    var uri=Uri.parse('http://courses-apps.herokuapp.com/public/api/profile');
    await http.get(uri,headers: {'Authorization':'Bearer $token',"Accept":"application/json"}).then((value) {
      print(value.body.toString());
      profileModel=ProfileModel.fromJson(jsonDecode(value.body));
      print(profileModel!.data!.name);
      emit(HomeGetProfileSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(HomeProfileErrorState());
    });
}




//Login
  LoginModel? loginModel;
  Future<void> login()async{
    var loginData={
      'email':'111111@gmail.com',
      'password':'AeAe111@'
    };
    emit(HomeLoginLoadingState());
    await http.post(Uri.parse('http://courses-apps.herokuapp.com/public/api/login'),body: loginData,headers: {'Accept':'application/json'})
        .then((value) {print(value.body.toString());
    loginModel = LoginModel.fromJson(jsonDecode(value.body));
    print(loginModel!.data!.email.toString());
    emit(HomeLoginSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(HomeLoginErrorState());
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
    emit(HomeBuyCourseLoadingState());
    await http.post(uri,headers: {"Accept":"application/json",'Authorization':'Bearer $token'},body: data).then((value) {
      buyCourseModel=BuyCourseModel.fromJson(jsonDecode(value.body));
      print(buyCourseModel!.msg);
      emit(HomeBuyCourseSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(HomeBuyCourseErrorState());
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
    emit(HomeCourseReviewLoadingState());
    await http.post(uri,headers: {"Accept":"application/json",'Authorization':'Bearer $token'},body: data).then((value) {
      courseReviewModel=CourseReviewModel.fromJson(jsonDecode(value.body));
      print(courseReviewModel!.msg);
      emit(HomeCourseReviewSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(HomeCourseReviewErrorState());
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
      emit(HomeCourseStoreMessageLoadingState());
      await http.post(uri,headers: {"Accept":"application/json",'Authorization':'Bearer $token'},body: data).then((value) {
        storeMessageModel=StoreMessageModel.fromJson(jsonDecode(value.body));
        print(storeMessageModel!.msg);
        emit(HomeCourseStoreMessageSuccessState());
      }).catchError((e){
        print(e.toString());
        emit(HomeCourseStoreMessageErrorState());
      });
    }


    //one course
  OneCourseModel? oneCourseModel;
  Future<void>getOneCourse()async{
    var uri=Uri.parse('http://courses-apps.herokuapp.com/public/api/course/1');
    emit(HomeOneCourseMessageLoadingState());
    await http.get(uri,headers: {"Accept":"application/json",'Authorization':'Bearer $token'}).then((value) {
      oneCourseModel=OneCourseModel.fromJson(jsonDecode(value.body));
      print(oneCourseModel!.data!.instructor!.phone);
      emit(HomeOneCourseMessageSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(HomeOneCourseMessageErrorState());
    });
  }

  //all courses
  AllCoursesModel? allCoursesModel;
  Future<void>getAllCourses()async{
    var uri=Uri.parse('http://courses-apps.herokuapp.com/public/api/course');
    emit(HomeAllCoursesMessageLoadingState());
    await http.get(uri,headers: {"Accept":"application/json",'Authorization':'Bearer $token'}).then((value) {
      allCoursesModel=AllCoursesModel.fromJson(jsonDecode(value.body));
      print(allCoursesModel!.data[0].materials[0].price);
      emit(HomeAllCoursesMessageSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(HomeAllCoursesMessageErrorState());
    });
  }

  //materials

  //get all materials
  AllMaterialsModel? allMaterialsModel;
  Future<void>getAllMaterials()async{
    var uri=Uri.parse('http://courses-apps.herokuapp.com/public/api/material');
    emit(HomeAllMaterialsLoadingState());
    await http.get(uri,headers: {"Accept":"application/json",'Authorization':'Bearer $token'}).then((value) {
      allMaterialsModel=AllMaterialsModel.fromJson(jsonDecode(value.body));
      print(allCoursesModel!.data[0].materials);
      emit(HomeAllMaterialsSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(HomeAllMaterialsErrorState());
    });
  }

  //get favorite materials
  FavoritesModel? favoritesModel;
  Future<void>getFavoritesMaterials()async{
    var uri=Uri.parse('http://courses-apps.herokuapp.com/public/api/favorite-material');
    emit(HomeAllMaterialsLoadingState());
    await http.get(uri,headers: {"Accept":"application/json",'Authorization':'Bearer $token'}).then((value) {
      favoritesModel=FavoritesModel.fromJson(jsonDecode(value.body));
      print(favoritesModel!.data[0].video);
      emit(HomeAllMaterialsSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(HomeAllMaterialsErrorState());
    });
  }
//get one material
  OneMaterialModel? oneMaterialModel;
  Future<void>getOneMaterial()async{
    var uri=Uri.parse('http://courses-apps.herokuapp.com/public/api/material/12');
    emit(HomeGetOneMaterialLoadingState());
    await http.get(uri,headers: {"Accept":"application/json",'Authorization':'Bearer $token'}).then((value) {
      oneMaterialModel=OneMaterialModel.fromJson(jsonDecode(value.body));
      print(oneMaterialModel!.msg);
      emit(HomeGetOneMaterialSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(HomeGetOneMaterialErrorState());
    });
  }

  BuyMaterialModel? buyMaterialModel;
  Future<void>buyMaterial()async{
    var data={
      'material_id':'2'
    };
    var uri=Uri.parse('http://courses-apps.herokuapp.com/public/api/material/buy');
    emit(HomeBuyMaterialLoadingState());
    await http.post(uri,headers: {"Accept":"application/json",'Authorization':'Bearer $token'},body: data).then((value) {
      buyMaterialModel=BuyMaterialModel.fromJson(jsonDecode(value.body));
      print(buyMaterialModel!.msg);
      emit(HomeBuyMaterialSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(HomeBuyMaterialErrorState());
    });
  }
  //add material to fav

  AddMaterialFavoriteModel? addMaterialFavoriteModel;
  Future<void>addMaterialFavorite()async{
    var data={
      'material_id':'2'
    };
    var uri=Uri.parse('http://courses-apps.herokuapp.com/public/api/favorite-material');
    emit(HomeAddMaterialFavoritesLoadingState());
    await http.post(uri,headers: {"Accept":"application/json",'Authorization':'Bearer $token'},body: data).then((value) {
      addMaterialFavoriteModel=AddMaterialFavoriteModel.fromJson(jsonDecode(value.body));
      print(addMaterialFavoriteModel!.msg);
      emit(HomeAddMaterialFavoritesSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(HomeAddMaterialFavoritesErrorState());
    });
  }

  //delete material from fav

  DeleteMaterialFavoriteModel? deleteMaterialFavoriteModel;
  Future<void>deleteMaterialFavorite()async{
    var data={
      'material_id':'2'
    };
    var uri=Uri.parse('http://courses-apps.herokuapp.com/public/api/favorite-material/2');
    emit(HomeDeleteMaterialFavoritesLoadingState());
    await http.delete(uri,headers: {"Accept":"application/json",'Authorization':'Bearer $token'},body: data).then((value) {
      deleteMaterialFavoriteModel=DeleteMaterialFavoriteModel.fromJson(jsonDecode(value.body));
      print(deleteMaterialFavoriteModel!.msg);
      emit(HomeDeleteMaterialFavoritesSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(HomeDeleteMaterialFavoritesErrorState());
    });
  }
}
