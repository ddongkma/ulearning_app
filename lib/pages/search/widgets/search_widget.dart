

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/constant.dart';
import 'package:ulearning_app/common/widgets/base_text_widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ulearning_app/pages/search/bloc/search_state.dart';
import 'package:ulearning_app/pages/search/search_controller.dart';

import '../../../common/values/colors.dart';
// late SearchControllerPage searchController ;
//   searchController = SearchControllerPage();
AppBar buildAppBar() {
  return AppBar(
    elevation: 0,
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 24.w,
            height: 24.h,
            child: Image.asset('assets/icons/arrow.png'),
          ),
          reusableText('Search', fontWeight: FontWeight.bold, fontSize: 18),
          SizedBox(
            width: 24.w,
            height: 24.h,
            child: Image.asset('assets/icons/shopping-cart.png'),
          ),
        ],
      ),
    ),
  );
}

Widget searchView(BuildContext context,SearchState state) {
  late SearchControllerPage searchController ;
  searchController = SearchControllerPage(context);
  return Container(
    margin: EdgeInsets.only(top: 25.h),
    child: Row(
      children: [
        Container(
          width: 280.w,
          height: 40.h,
          decoration: BoxDecoration(
              color: AppColors.primaryBackground,
              border: Border.all(color: AppColors.primaryFourElementText),
              borderRadius: BorderRadius.circular(20.w)),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 7.w),
                width: 25.w,
                height: 25.h,
                child: Image.asset("assets/icons/search.png"),
              ),
              Container(
                width: 240.w,
                height: 40.h,
                child: TextField(
                  onChanged: (value){
                    searchController.filterCourses(value,state);
                  },
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      hintText: "Search profile...",
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      disabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      hintStyle:
                          TextStyle(color: Colors.grey.withOpacity(0.5))),
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.normal,
                    fontSize: 14.sp,
                  ),
                  autocorrect: false,
                  obscureText: false,
                  cursorColor: Colors.black12,
                ),
              )
            ],
          ),
        ),
        GestureDetector(
          child: Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.w),
                color: AppColors.primaryElement,
                border: Border.all(color: AppColors.primaryElement)),
            child: Image.asset("assets/icons/options.png"),
          ),
        )
      ],
    ),
  );
}

Widget courseSearchList(String name, String urlImage) {
  return Container(
    margin: EdgeInsets.only(top: 20.h),
    padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
    width: 325.w,
    height: 80.h,
    decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 225, 0.1),
        borderRadius: BorderRadius.circular(15.w),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 70.w,
                height: 80.h,
                decoration: BoxDecoration(
                    image:  DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage('${AppConstants.SERVER_UPLOADS}$urlImage'),
                    ),
                    borderRadius: BorderRadius.circular(10.w)),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _listSearchContainer(name),
                  _listSearchContainer(name,fontWeight: FontWeight.normal),
                   // Expanded(child:_rateCourse() ),
                  _rateCourse()
                ],
              )
            ],
          ),
          SizedBox(
            height: 24.h,
            width: 24.w,
            child: Image.asset('assets/icons/arrow_right.png'),
          )
        ],
      ),
    ),
  );
}

Widget _listSearchContainer(String text,
    {Color color = AppColors.primaryText,
    FontWeight fontWeight = FontWeight.bold,
    double fontSize = 14}) {
  return Container(
    margin: EdgeInsets.only(left: 10.w),
    width: 185.w,
    child: Text(text,
        maxLines: 1,
        overflow: TextOverflow.clip,
        style: TextStyle(
            color: color, fontWeight: fontWeight, fontSize: fontSize.sp)),
  );
}

Widget _rateCourse(){
  return Container(
    margin: EdgeInsets.only(left: 10.w),
    // width: 100.w,
    // height:5.h,
    child: RatingBar.builder(
      itemSize: 20,
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    ),
  );
}
