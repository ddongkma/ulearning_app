
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ulearning_app/pages/search/bloc/search_event.dart';
import 'package:ulearning_app/pages/search/bloc/search_state.dart';



class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState()) {
      on<TestCourseItemEvent>(_testCourseItemEvent);
  }

  FutureOr<void> _testCourseItemEvent(TestCourseItemEvent event, Emitter<SearchState> emit) {
    emit(state.copyWith(courseItem : event.courseItem));
  }
}
