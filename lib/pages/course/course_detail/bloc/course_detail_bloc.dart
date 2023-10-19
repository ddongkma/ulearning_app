import 'dart:async';

import 'package:bloc/bloc.dart';

import 'course_detail_event.dart';
import 'course_detail_state.dart';

class CourseDetailBloc extends Bloc<CourseDetailEvents, CourseDetailState> {
  CourseDetailBloc() : super(const CourseDetailState()) {
    on<TriggerCourseDetailEvent>(_triggerCourseDetailEvent);
  }

  FutureOr<void> _triggerCourseDetailEvent(
      TriggerCourseDetailEvent event, Emitter<CourseDetailState> emit) {
    emit(state.copyWith(courseItem: event.courseItem));
  }
}
