import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ulearning_app/pages/home/bloc/home_event.dart';
import 'package:ulearning_app/pages/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super( const HomeState()) {
    on<HomeDotsEvent>(_homeDotsEvent);
    on<HomePageCourseItemEvent>(_homePageCourseItemEvent);
  }

  FutureOr<void> _homeDotsEvent(HomeDotsEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(index: event.index));
  }

  FutureOr<void> _homePageCourseItemEvent(
      HomePageCourseItemEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(courseItem: event.courseItem));
  }
}
