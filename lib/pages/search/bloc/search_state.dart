
 import 'package:ulearning_app/common/entities/course.dart';

class SearchState {
  final List<CourseItem> courseItem ;
  final List<CourseItem> searchItem ;
  const SearchState({this.courseItem = const <CourseItem>[],this.searchItem = const <CourseItem>[]});
  SearchState copyWith({List<CourseItem>? courseItem,List<CourseItem>? searchItem}){
    return  SearchState(
        courseItem: courseItem??this.courseItem,
        searchItem: searchItem??this.searchItem
    );
  }
 }


