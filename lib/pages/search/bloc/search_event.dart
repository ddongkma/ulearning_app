 import '../../../common/entities/course.dart';

abstract class SearchEvent {
  const SearchEvent();
 }


 class TestCourseItemEvent extends SearchEvent {
   final List<CourseItem> courseItem;
   const TestCourseItemEvent(this.courseItem);
 }
 class SearchCourseItemEvent extends SearchEvent {
   final List<CourseItem> searchItem;
   const SearchCourseItemEvent(this.searchItem);
 }