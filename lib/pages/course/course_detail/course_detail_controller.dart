import 'package:flutter/material.dart';
import 'package:ulearning_app/common/entities/course.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';

import '../../common/apis/course_api.dart';

class CourseDetailController{
  final BuildContext context;
  CourseDetailController({required this.context});

 void init() async {
   final args =  ModalRoute.of(context)!.settings.arguments as Map;

 }
 asyncLoadAllData(int id) async{
   CourseRequestEntity courseRequestEntity = CourseRequestEntity();
   courseRequestEntity.id = id;
   var result = await CourseApi.courseDetail(params: courseRequestEntity);
   if(result.code == 200){
     
   }else{
     toastInfo(msg: "Something went wrong");
     print("----------Error Code ${result.code}---------");
   }
   
 }
}