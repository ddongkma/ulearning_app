import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ulearning_app/pages/application/bloc/app_event.dart';
import 'package:ulearning_app/pages/application/bloc/app_state.dart';


class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<TriggerAppEvent>((event, emit){
      emit(AppState(index: event.index));
    });
  }
}

  



