import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/common/widgets/base_text_widgets.dart';
import 'package:ulearning_app/pages/course/course_detail_controller.dart';
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
    _courseDetailController= CourseDetailController(context: context);
    _courseDetailController.init();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    thumbNail(),
                    SizedBox(height: 15.h),
                    menuView(),
                    SizedBox(height: 20.h),
                    reusableText("Course Descriptions", fontSize: 18),
                    SizedBox(height: 15.h),
                    descriptionText(),
                    SizedBox(height: 20.h),
                    goBuyButton("Go Buy"),
                    SizedBox(height: 20.h),
                    courseSummaryTitle(),

                    SizedBox(height: 15.h),
                    courseSummaryView(context),

                    SizedBox(height: 5.h),
                    reusableText("Lesson List", fontSize: 18),
                    SizedBox(height: 10.h),
                    courseLessonList(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
