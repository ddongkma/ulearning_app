import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ulearning_app/pages/profile/settings/bloc/setting_page_event.dart';
import 'package:ulearning_app/pages/profile/settings/bloc/setting_page_state.dart';

class SettingPageBloc extends Bloc<SettingPageEvent, SettingPageState> {
  SettingPageBloc() : super(const SettingPageState()) {
    on<TriggerSettings>(_triggerSettings);
  }

  FutureOr<void> _triggerSettings(
      TriggerSettings event, Emitter<SettingPageState> emit) {
    emit(const SettingPageState());
  }
}
