


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_bloc.dart';

class SignInController {
  final BuildContext context;

  const SignInController({ required this.context});

  Future<void> handleSignIn(String type) async {
    try{
      if(type=='email'){
          final state = context.read<SignInBloc>().state;
          String emailAddress = state.email;
          String password = state.password;
          if(emailAddress.isEmpty){
            toastInfo(msg: "You need fill your email address");
          }
          if(password.isEmpty){
            toastInfo(msg: "You need fill your password ");

          }
          try{
              final credentials = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailAddress, password: password);
              if(credentials.user==null){
                toastInfo(msg: "You don't exits");
              }
              if(!credentials.user!.emailVerified){
                toastInfo(msg: "You need verify your email account");
              }
              var user = credentials.user;
              if(user!= null){
                print('user exits');

              }else{
                toastInfo(msg: "Currently you are not a user of this app");
              }

          }on FirebaseAuthException catch(e){
            if(e.code =='user-not-found'){
              print('No user found for that email');
              toastInfo(msg: "No user found for that email");

            }else if(e.code=='wrong-password'){
              print('Wrong password provided for that user');
              toastInfo(msg: "Wrong password provided for that user");
            }else if(e.code=='invalid-email'){
              print('Your email format is wrong');
              toastInfo(msg: "Your email format is wrong");
            }
          }
      }
    }catch(e){

    }
  }
}