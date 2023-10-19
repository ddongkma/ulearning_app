import 'package:ulearning_app/common/entities/course.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class HomeDotsEvent extends HomeEvent{
  final int index;
  const HomeDotsEvent(this.index):super();
}

class HomePageCourseItemEvent extends HomeEvent{
  final List<CourseItem> courseItem;
  const HomePageCourseItemEvent(this.courseItem);
}
