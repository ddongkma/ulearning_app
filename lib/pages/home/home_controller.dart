import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/apis/course_api.dart';
import 'package:ulearning_app/common/entities/entities.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/home/bloc/home_bloc.dart';
import 'package:ulearning_app/pages/home/bloc/home_event.dart';

class HomeController{
  late BuildContext context;
  UserItem? get  userProfile => Global.storageService.getUserProfile();
  static final HomeController _singleton = HomeController._internal();
  HomeController._internal();

   factory HomeController({required BuildContext context}){
     _singleton.context = context;
     return _singleton;
   }
  Future<void> init() async {
    if(Global.storageService.getAccessToken().isNotEmpty){
      var result = await CourseApi.courseList();
      if(result.code==200){
        if(context.mounted){
          print(result);
          context.read<HomeBloc>().add(HomePageCourseItemEvent(result.data!));
        }
      }else{
        print(result.code);
      }
    } else{
      print("User has already logged out.");
    }
  }
}