import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ulearning_app/common/entities/user.dart';
import 'package:ulearning_app/common/routes/names.dart';
import 'package:ulearning_app/common/values/constant.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_bloc.dart';

import '../../common/apis/user_api.dart';
import '../../common/entities/staff.dart';
import '../../common/service/AuthService.dart';
import '../home/home_controller.dart';

class SignInController {
  final BuildContext context;
  final googleSignIn = GoogleSignIn();
  final AuthService _authService = AuthService();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user=> _user!;
  SignInController({required this.context});

  // Future googleLogin() async {
  //   final googleUser = await googleSignIn.signIn();
  //   if(googleUser == null) return;
  //   _user = googleUser;
  //   print('${_user?.displayName??'rỗng'} ');
  //   final  googleAuth = await googleUser.authentication;
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken
  //   );
  //   await FirebaseAuth.instance.signInWithCredential(credential);
  //   // if (context.mounted) {
  //   //   await HomeController(context: context).init();
  //   // }
  // }
  

  Future<void> handleSignIn(String type) async {
    try {
      if (type == 'email') {
        final state = context
            .read<SignInBloc>()
            .state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          toastInfo(msg: "You need fill your email address");
        }
        if (password.isEmpty) {
          toastInfo(msg: "You need fill your password ");
        }
        LoginRequest staff = LoginRequest(email : emailAddress,password : password);

        print("Sending data: ${staff.toJson1()}");
        // var result = await UserAPI.login(params: staff);
        // final user = await _authService.login(emailAddress, password);

        // if (user != null) {
        //   // print('Login successful: ${user.fullName}');
        //   // Chuyển hướng hoặc cập nhật giao diện với thông tin người dùng
        // } else {
        //   print('Login failed');
        //   // Hiển thị thông báo lỗi
        // }

        // final credentials = await FirebaseAuth.instance
        //     .signInWithEmailAndPassword(
        //         email: emailAddress, password: password);
        // if (credentials.user == null) {
        //   toastInfo(msg: "You don't exits");
        // }
        // if (!credentials.user!.emailVerified) {
        //   toastInfo(msg: "You need verify your email account");
        // }
        // var user = credentials.user;
        // if (user != null) {
        //   String? displayName = user.displayName;
        //   String? email = user.email;
        //   String? id = user.uid;
        //   String? photoUrl = user.photoURL;

        // //   loginRequestEntity.name = displayName;
        // //   loginRequestEntity.email = email;
        // //   // loginRequestEntity.avatar = photoUrl;
        // //   // loginRequestEntity.open_id = id;
        // //   loginRequestEntity.type = 1;
          await asyncPostAllData(staff);
          if (context.mounted) {
            await HomeController(context: context).init();
          }
          // }

        // } else {
        //   toastInfo(msg: "Currently you are not a user of this app");
        // }
        // } on FirebaseAuthException catch (e) {
        //   if (e.code == 'user-not-found') {
        //     print('No user found for that email');
        //     toastInfo(msg: "No user found for that email");
        //   } else if (e.code == 'wrong-password') {
        //     print('Wrong password provided for that user');
        //     toastInfo(msg: "Wrong password provided for that user");
        //   } else if (e.code == 'invalid-email') {
        //     print('Your email format is wrong');
        //     toastInfo(msg: "Your email format is wrong");
        //   }
        // }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> asyncPostAllData(LoginRequest staff) async {
    EasyLoading.show(
      indicator: const CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );
    var result = await UserAPI.login(params: staff);
    if (result != null ) {
      try {
        Global.storageService.setString(
            AppConstants.STORAGE_USER_PROFILE_KEY, jsonEncode(result.toJson()));

        Global.storageService.setString(
            AppConstants.STORAGE_USER_TOKEN_KEY, result.accessToken!);
        EasyLoading.dismiss();
        if (context.mounted) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              PageRoutes.APPLICATION, (route) => false);
        }
      } catch (e) {
        print("saving local storage error ${e.toString()}");
      }
    } else {
      EasyLoading.dismiss();
      toastInfo(msg: "Invalid email or password");
    }
  }
}
