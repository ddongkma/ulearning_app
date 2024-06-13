import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ulearning_app/common/entities/course.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';
import 'package:ulearning_app/pages/course/course_detail/bloc/course_detail_bloc.dart';

import '../../../common/apis/profile.dart';
import 'bloc/course_detail_event.dart';

class CourseDetailController{
  final BuildContext context;
  CourseDetailController({required this.context});

 void init() async {
   final args =  ModalRoute.of(context)!.settings.arguments as Map;
   asyncLoadAllData(args["id"]);
 }
 asyncLoadAllData(int id) async{
   CourseRequestEntity courseRequestEntity = CourseRequestEntity();
   courseRequestEntity.id = id;
   var result = await CourseApi.courseDetail(params: courseRequestEntity);
   if(result.code == 200){
     if(context.mounted){
       context.read<CourseDetailBloc>().add(TriggerCourseDetailEvent(result.data!));
     }
     else{
       print("---------context is not available---------");
     }
   }else{
     toastInfo(msg: "Something went wrong");
     print("----------Error Code ${result.code}---------");
   }
   
 }

 Future<void> goBuy(int? id) async {
   EasyLoading.show(
     indicator: CircularProgressIndicator(),
     maskType: EasyLoadingMaskType.clear,
     dismissOnTap: true,

   );
   CourseRequestEntity courseRequestEntity = CourseRequestEntity();
   courseRequestEntity.id = id;
   var result = await CourseApi.coursePay(params:courseRequestEntity );
   EasyLoading.dismiss();
   if(result.code==200){
     var url= Uri.decodeFull(result.data!);

     print("----my return stripe url is $url");
   }else{
     print("------failed payment-----------");
   }
 }
}