import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/entities/course.dart';
import 'package:ulearning_app/pages/search/bloc/search_bloc.dart';
import 'package:ulearning_app/pages/search/bloc/search_event.dart';
import 'package:ulearning_app/pages/search/bloc/search_state.dart';

import '../../common/apis/course_api.dart';

class SearchControllerPage{
  final BuildContext context;
  SearchControllerPage(this.context);
  List<CourseItem> _filteredItems = [];

  List<CourseItem> get filteredItems => _filteredItems;
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
  Future<void> filterCourses(String value,SearchState state) async {
    _filteredItems = state.courseItem
        .where((item) => item.name!.toLowerCase().contains(value.toLowerCase()))
        .toList();
    context.read<SearchBloc>().add(SearchCourseItemEvent(_filteredItems));
  }
  }
