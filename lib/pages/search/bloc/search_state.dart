
 import 'package:ulearning_app/common/entities/course.dart';

class SearchState {
  final List<CourseItem> courseItem ;
  const SearchState({this.courseItem = const <CourseItem>[]});
  SearchState copyWith({List<CourseItem>? courseItem}){
    return  SearchState(
      courseItem: courseItem??this.courseItem
    );
  }
 }


