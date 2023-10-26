import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/search/bloc/search_bloc.dart';
import 'package:ulearning_app/pages/search/bloc/search_event.dart';

import '../../common/apis/course_api.dart';

class SearchControllerPage{
  final BuildContext context;
  SearchControllerPage( this.context);
  Future<void> init() async {
      var result = await CourseApi.courseList();
      if(result.code==200){
        if(context.mounted){
          context.read<SearchBloc>().add(TestCourseItemEvent(result.data!));
        }
      }else{
        print(result.code);
      }

    }
  }
