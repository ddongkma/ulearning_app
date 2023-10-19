import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/common_widgets.dart';
import 'package:ulearning_app/pages/register/bloc/register_bloc.dart';
import 'package:ulearning_app/pages/register/bloc/register_event.dart';
import 'package:ulearning_app/pages/register/bloc/register_state.dart';
import 'package:ulearning_app/pages/register/register_controller.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: builderAppbar("Register"),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Center(child: reusableText("Enter your details below & free sign up!")),
                    Container(
                      margin: EdgeInsets.only(top: 66.h),
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText("User name"),
                          // SizedBox(height: 5.h),
                          buildTextField(
                              "Enter your user name", "name", "user", (value) {
                             context.read<RegisterBloc>().add(UserNameEvent(value));
                          }),
                          reusableText("Email"),
                          // SizedBox(height: 5.h),
                          buildTextField("Enter your email address", "email", "user",
                                  (value) {
                                 context.read<RegisterBloc>().add(EmailEvent(value));
                              }),
                          reusableText("Password"),
                          // SizedBox(height: 5.h),
                          buildTextField("Enter your password", "password", "lock",
                                  (value) {
                                 context.read<RegisterBloc>().add(PasswordEvent(value));
                              }),
                          reusableText("Confirm password"),
                          // SizedBox(height: 5.h),
                          buildTextField("Enter your confirm password", "password", "lock",
                                  (value) {
                                 context.read<RegisterBloc>().add(RePasswordEvent(value));
                              }),
                          reusableText("By creating an account you have to agree with our them & condication."),
                          buildLogInAndRegButton("Sign Up", "login", () {
                            RegisterController(context).handleEmailRegister();
                          }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )),
      );
    });
  }
}
