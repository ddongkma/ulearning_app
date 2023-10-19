import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/home/home_pge.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_bloc.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_event.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_state.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.lime,
        child: Scaffold(
          body: BlocBuilder<WelcomeBloc, WelcomeState>(
            builder: (context, state) => Container(
              margin: EdgeInsets.only(top: 34.h),
              width: 375.w,
              child: Stack(alignment: Alignment.topCenter, children: [
                PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    state.page = index;
                    BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                  },
                  children: [
                    _page(
                        1,
                        context,
                        'Next',
                        'First See Learning',
                        'Forget about a for of paper all knowledge in one learning!',
                        'assets/images/reading.png'),
                    _page(
                        2,
                        context,
                        'Next',
                        'Latest See Learning',
                        'Forget about a for of paper all !',
                        'assets/images/boy.png'),
                    _page(
                        3,
                        context,
                        'Get Started',
                        'First See Learning',
                        'Forget about a for of paper all knowledge in one learning!',
                        'assets/images/man.png')
                  ],
                ),
                Positioned(
                    bottom: 80.h,
                    child: DotsIndicator(
                      position: state.page,
                      dotsCount: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                          color: Colors.black12,
                          activeColor: Colors.teal,
                          size: const Size.square(8.0),
                          activeSize: const Size(18, 8),
                          activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          )),
                    ))
              ]),
            ),
          ),
        ));
  }

  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subtitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 375.w,
          height: 375.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          width: 375.w,
          height: 70.h,
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
          child: Text(
            subtitle,
            style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontSize: 16.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              _pageController.animateToPage(index,
                  duration: Duration(milliseconds: 400), curve: Curves.linear);
            } else {
              // Navigator.of(context).push(MaterialPageRoute(builder: (_)=> HomePage()));
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("signIn", (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 50.h, right: 20.w, left: 20.w),
            width: 375.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(15.w)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 6))
                ]),
            child: Center(
                child: Text(
              buttonName,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                  color: Colors.white),
            )),
          ),
        )
      ],
    );
  }
}
