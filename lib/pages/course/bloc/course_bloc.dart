import 'dart:async';

import 'package:bloc/bloc.dart';
import 'course_event.dart';
import 'course_state.dart';

class CourseBloc extends Bloc<CourseEvents, CourseState> {
  CourseBloc() : super(const CourseState()) {
    on<TriggerCourseEvent>(_triggerCourseEvent);
  }

  FutureOr<void> _triggerCourseEvent(
      TriggerCourseEvent event, Emitter<CourseState> emit) {
    emit(state.copyWith(courseItem: event.courseItem));
  }
}
