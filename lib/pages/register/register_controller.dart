import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';
import 'package:ulearning_app/pages/register/bloc/register_bloc.dart';

import '../../common/values/constant.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController(this.context);

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: "User name can not be empty");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email can not be empty");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password can not be empty");
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: "RePassword can not be empty");
      return;
    }
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        String photoUrl= "uploads/ky1.jpg";
        await credential.user?.updatePhotoURL(photoUrl);
        toastInfo(
            msg:
                "An email has been sent to your register email. To activate it please check your email box and click on the link.");
        if(context.mounted){
          Navigator.of(context).pop();
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: "the password provided is to weak");
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: "The Email already in use");
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: "Your email is invalid");
      }
    }
  }
}
