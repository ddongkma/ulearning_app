import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/entities/course.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/common/values/constant.dart';
import 'package:ulearning_app/common/widgets/base_text_widgets.dart';
import 'package:ulearning_app/pages/course/course_detail/bloc/course_detail_state.dart';

AppBar buildAppBar() {
  return AppBar(
    centerTitle: true,
    elevation: 1,
    title: reusableText("Course Details", fontSize: 20),
  );
}

Widget thumbNail(String thumbNail) {
  return Container(
    height: 200.h,
    width: 325.w,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w),
        image:  DecorationImage(
            fit: BoxFit.fill, image:NetworkImage("${AppConstants.SERVER_UPLOADS}$thumbNail"))),
  );
}

Widget menuView() {
  return Container(
    width: 325.w,
    child: Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.w),
                color: AppColors.primaryElement,
                border: Border.all(color: AppColors.primaryElement)),
            child: reusableText("Author Page",
                color: AppColors.primaryElementText,
                fontWeight: FontWeight.normal,
                fontSize: 14),
          ),
        ),
        _iconAndNum("assets/icons/people.png", 0),
        _iconAndNum("assets/icons/star.png", 0)
      ],
    ),
  );
}

Widget _iconAndNum(String iconPath, int num) {
  return Container(
    margin: EdgeInsets.only(left: 20.w),
    child: Row(
      children: [
        Image(image: AssetImage(iconPath), width: 20.w, height: 20.h),
        reusableText(num.toString(),
            color: AppColors.primaryThreeElementText,
            fontSize: 13,
            fontWeight: FontWeight.normal)
      ],
    ),
  );
}

Widget goBuyButton(String name) {
  return Container(
    padding: EdgeInsets.only(top: 14.h),
    width: 325.w,
    height: 50.h,
    decoration: BoxDecoration(
        color: AppColors.primaryElement,
        borderRadius: BorderRadius.circular(10.w),
        border: Border.all(color: AppColors.primaryElement)),
    child: Text(
      name,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: AppColors.primaryThreeElementText,
          fontSize: 18.sp,
          fontWeight: FontWeight.normal),
    ),
  );
}

Widget descriptionText(String description) {
  return reusableText(
      description,
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: AppColors.primaryThreeElementText);
}

Widget courseSummaryTitle() {
  return reusableText("The course Includes", fontSize: 18);
}


Widget courseSummaryView(BuildContext context ,CourseDetailState state) {

  var imageInfors = <String, String>{
    "${state.courseItem!.video_length??'0'} Hours Video": "video_detail.png",
    "Total ${state.courseItem!.lesson_num??'0'} Lessons": "file_detail.png",
    "${state.courseItem!.down_num??'0'} Download Resources": "download_detail.png",
  };
  return Column(
    children: [
      ...List.generate(
          imageInfors.length,
          (index) => GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(bottom: 15.h),
                  child: Row(
                    children: [
                      Container(
                        // padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 6.h),
                        margin: EdgeInsets.only(right: 10.w),
                        width: 30.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          color: AppColors.primaryElement,
                          borderRadius: BorderRadius.circular(10.w),
                        ),
                        child: Image.asset(
                            "assets/icons/${imageInfors.values.elementAt(index)}"),
                      ),
                      Text(imageInfors.keys.elementAt(index),
                          style: TextStyle(
                            color: AppColors.primarySecondaryElementText,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ))
                    ],
                  ),
                ),
              ))
    ],
  );
}

Widget courseLessonList(String image,String name) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
    width: 325.w,
    height: 80.h,
    decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 225, 0.1),
        borderRadius: BorderRadius.circular(10.w),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 3,
              spreadRadius: 2,
              offset: const Offset(0, 6))
        ]),
    child: InkWell(
      onTap: (){},
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  image:  DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage("${AppConstants.SERVER_UPLOADS}$image")),
                  borderRadius: BorderRadius.circular(10.w),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _listContainer(name),
                  _listContainer(name,
                      fontWeight: FontWeight.normal,
                      color: AppColors.primaryThreeElementText,
                      fontSize: 12),
                ],
              ),
            ],
          ),
          Image(
            width: 24.w,
            height: 24.h,
            image: const AssetImage("assets/icons/arrow_right.png"),
          )
        ],
      ),
    ),
  );
}

Widget _listContainer(
    String name,
    {double fontSize = 14,
    Color color = AppColors.primaryText,
    FontWeight fontWeight = FontWeight.bold}) {
  return Container(
    margin: EdgeInsets.only(left: 10.w),
    width: 200.w,
    child: Text(
      name,
      maxLines: 1,
      overflow: TextOverflow.clip,
      style: TextStyle(
          fontSize: fontSize.sp, fontWeight: fontWeight, color: color),
    ),
  );
}
