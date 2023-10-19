import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/pages/application/widgets/application_widgets.dart';
import 'package:ulearning_app/pages/application/bloc/app_bloc.dart';
import 'package:ulearning_app/pages/application/bloc/app_event.dart';
import 'package:ulearning_app/pages/application/bloc/app_state.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(builder: (context, state) {
    return SafeArea(
        child: Scaffold(
      body: buildPage(state.index),
      bottomNavigationBar: Container(
        width: 375.w,
        height: 58.h,
        decoration: BoxDecoration(
          color: AppColors.primaryElement,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.h),topRight: Radius.circular(20.h)),
          boxShadow: [
            BoxShadow(
            color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 1
          )
          ]
        ),
        child: BottomNavigationBar(
          currentIndex: state.index,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (value) => {
            context.read<AppBloc>().add(TriggerAppEvent(value)),
          },
          elevation: 0,
          items:bottomTabs ,
        ),
      ),
    ));
  },
);
  }
}
