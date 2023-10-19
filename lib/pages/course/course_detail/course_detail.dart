import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/common/widgets/base_text_widgets.dart';
import 'package:ulearning_app/pages/course/course_detail/bloc/course_detail_bloc.dart';
import 'package:ulearning_app/pages/course/course_detail/bloc/course_detail_state.dart';
import 'package:ulearning_app/pages/course/course_detail/course_detail_controller.dart';
import 'package:ulearning_app/pages/course/widgets/course_detail_widget.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({super.key});

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  late CourseDetailController _courseDetailController;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _courseDetailController = CourseDetailController(context: context);
    _courseDetailController.init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseDetailBloc, CourseDetailState>(
        builder: (context, state) {
      return state.courseItem== null? const Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.blue,
        ),
      ):Container(
        color: Colors.white,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      thumbNail(state.courseItem!.thumbnail.toString()),
                      SizedBox(height: 15.h),
                      menuView(),
                      SizedBox(height: 20.h),
                      reusableText("Course Descriptions", fontSize: 18),
                      SizedBox(height: 15.h),
                      descriptionText(state.courseItem!.description.toString()),
                      SizedBox(height: 20.h),
                      GestureDetector(
                        onTap: (){
                          _courseDetailController.goBuy(state.courseItem!.id);
                        },
                          child: goBuyButton("Go Buy")),
                      SizedBox(height: 20.h),
                      courseSummaryTitle(),
                      SizedBox(height: 15.h),
                      courseSummaryView(context,state),
                      SizedBox(height: 5.h),
                      reusableText("Lesson List", fontSize: 18),
                      SizedBox(height: 10.h),
                      courseLessonList(state.courseItem!.thumbnail.toString(),
                          state.courseItem!.name.toString()),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
