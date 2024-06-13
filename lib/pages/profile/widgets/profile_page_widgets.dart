import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/routes/names.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/common/widgets/base_text_widgets.dart';

AppBar buildAppBar() {
  return AppBar(
    elevation: 0,
    // backgroundColor: Colors.white,
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 18.w,
            height: 20.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          reusableText("Profile",fontSize: 20),
          SizedBox(
            width: 18.w,
            height: 20.h,
            child: Image.asset("assets/icons/more-vertical.png"),
          ),
        ],
      ),
    ),
  );
}

Widget profileIconAndEditButton() {
  return Container(
    margin: EdgeInsets.only(top: 10.h),
    padding: EdgeInsets.only(right: 5.w),
    width: 80.w,
    height: 80.h,
    alignment: Alignment.bottomRight,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w),
        image: const DecorationImage(
            image: AssetImage("assets/icons/headpic.png"))),
    child: GestureDetector(
      child: Image(
          width: 25.w,
          height: 25.h,
          image: const AssetImage("assets/icons/edit_3.png")),
    ),
  );
}

Widget buildListContax() {
  return SizedBox(
    width: 325.w,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          child: Container(
            padding: EdgeInsets.only(top: 5.h),
            width: 80.w,
            height: 56.h,
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.circular(10.w)),
            child: Column(
              children: [
                Container(
                    width: 25.w,
                    height: 25.h,
                    child: Image.asset("assets/icons/profile_video.png")),
                Text("My Course",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.primaryElementText,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                    ))
              ],
            ),
          ),
        ),
        GestureDetector(
          child: Container(
            padding: EdgeInsets.only(top: 5.h),
            width: 80.w,
            height: 56.h,
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.circular(10.w)),
            child: Column(
              children: [
                Container(
                    width: 25.w,
                    height: 25.h,
                    child: Image.asset("assets/icons/profile_book.png")),
                Text("Buy Course",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.primaryElementText,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                    ))
              ],
            ),
          ),
        ),
       GestureDetector(
         child:  Container(
           padding: EdgeInsets.only(top: 5.h),
           width: 80.w,
           height: 56.h,
           decoration: BoxDecoration(
               color: AppColors.primaryElement,
               borderRadius: BorderRadius.circular(10.w)),
           child: Column(
             children: [
               Container(
                   width: 25.w,
                   height: 25.h,
                   child: Image.asset("assets/icons/profile_star.png")),
               Text("4.9",
                   maxLines: 1,
                   overflow: TextOverflow.ellipsis,
                   style: TextStyle(
                     color: AppColors.primaryElementText,
                     fontSize: 11.sp,
                     fontWeight: FontWeight.bold,
                   ))
             ],
           ),
         ),
       )
      ],
    ),
  );
}


var imageInfors = <String,String>{
  "Settings" : "settings.png",
  // 'Payment details' : "credit-card.png",
  // 'Achievement' : 'award.png',
  // 'Love' : 'heart(1).png',
  // 'Reminders' : 'cube.png'
};
Widget buildListView(BuildContext context) {
  return Column(
    children: [
      ...List.generate(imageInfors.length, (index) =>
          GestureDetector(
            onTap: ()=> Navigator.of(context).pushNamed(PageRoutes.SETTINGSPAGE),
        child: Container(
          margin: EdgeInsets.only(bottom: 15.h),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 10.w),
                width: 40.w,
                height: 40.h,
                child: Image.asset("assets/icons/${imageInfors.values.elementAt(index)}"),
                decoration: BoxDecoration(
                  color: AppColors.primaryElement,
                  borderRadius: BorderRadius.circular(10.w),
                ),
              ),
              Text(imageInfors.keys.elementAt(index),
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ))
            ],
          ),
        ),
      ))
    ],
  );
}
