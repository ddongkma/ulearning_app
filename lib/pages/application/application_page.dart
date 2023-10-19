import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/pages/application/application_widgets.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
          child: Scaffold(
        body: buildPage(_index),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (value) => {
            setState((){
              _index= value;
            })
          },
          elevation: 0,
          items: [
            BottomNavigationBarItem(
                label: "home",
                icon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset("assets/icons/home.png"),
                ),
              activeIcon:SizedBox(
                  width: 15.w,
                  height: 15.h,
                child: Image.asset("assets/icons/home.png",color: AppColors.primaryElement,),
            )),
            BottomNavigationBarItem(
                label: "search",
                icon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset("assets/icons/search.png"),
                ),
                activeIcon:SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset("assets/icons/search.png",color: AppColors.primaryElement,),
                )
            ),
            BottomNavigationBarItem(
                label: "search",
                icon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset("assets/icons/play-circle1.png"),
                ),
                activeIcon:SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset("assets/icons/play-circle1.png",color: AppColors.primaryElement,),
                )
            ),
            BottomNavigationBarItem(
                label: "search",
                icon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset("assets/icons/plus.png"),
                ),
                activeIcon:SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset("assets/icons/home.png",color: AppColors.primaryElement,),
                )
            )
          ],
        ),
      )),
    );
  }
}
