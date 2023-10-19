
import 'package:bloc/bloc.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_event.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {
    on<EmailEvent>(emailEvent);
    on<PasswordEvent>(passwordEvent);
  }
  void emailEvent(EmailEvent event , Emitter<SignInState> emit) {
    emit(state.copyWith(email: event.email));
  }
  void passwordEvent(PasswordEvent event , Emitter<SignInState> emit) {
    emit(state.copyWith(password: event.password));
  }
}
