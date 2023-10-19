
import 'package:ulearning_app/common/entities/course.dart';

class HomeState {

  const HomeState({this.index=0,this.courseItem = const <CourseItem>[]});
   final int index;
   final List<CourseItem> courseItem ;
  HomeState copyWith({int? index, List<CourseItem>? courseItem}){
    return  HomeState(
      courseItem: courseItem??this.courseItem,
      index:index??this.index
    );
  }
}



