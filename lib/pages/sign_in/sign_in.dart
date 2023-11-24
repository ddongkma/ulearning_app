import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_event.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_state.dart';
import 'package:ulearning_app/pages/sign_in/sign_in_controller.dart';
import 'package:ulearning_app/pages/sign_in/widgets/sign_in_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return KeyboardDismisser(
        child: Container(
          color: Colors.white,
          child: SafeArea(
              child: Scaffold(
            backgroundColor: Colors.white,
            appBar: builderAppbar("Log In"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildThirdPartyLogin(context, () {}),
                  Center(
                      child: reusableText("Or use your email account login")),
                  Container(
                    margin: EdgeInsets.only(top: 66.h),
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText("Email"),
                        SizedBox(height: 5.h),
                        buildTextField(
                            "Enter your email address", "email", "user",
                            (value) {
                          context.read<SignInBloc>().add(EmailEvent(value));
                        }),
                        reusableText("Password"),
                        SizedBox(height: 5.h),
                        buildTextField(
                            "Enter your password", "password", "lock", (value) {
                          context.read<SignInBloc>().add(PasswordEvent(value));
                        }),
                        forgotPassword(),
                        buildLogInAndRegButton("Log in", "login", () {
                          SignInController(context: context)
                              .handleSignIn('email');
                        }),
                        buildLogInAndRegButton("Register", "register", () {
                          Navigator.of(context).pushNamed("/register");
                        }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
        ),
      );
    });
  }
}
