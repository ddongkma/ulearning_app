import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';

AppBar builderAppbar(String title) {
  return AppBar(
    shadowColor: Colors.white,
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.normal,
          color: AppColors.primaryText),
    ),
  );
}

Widget buildThirdPartyLogin(BuildContext context,void Function()? func) {
  return Container(
    margin: EdgeInsets.only(top: 25.h, bottom: 25.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _reusableIcon("google",func),
        _reusableIcon("apple",func),
        _reusableIcon("facebook",func),
      ],
    ),
  );
}

Widget _reusableIcon(String iconName ,void Function()? func) {
  return GestureDetector(
    onTap: () {

    },
    child: SizedBox(
      width: 40.w,
      height: 40.w,
      child: Image.asset("assets/icons/$iconName.png"),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
      margin: EdgeInsets.only(bottom: 5.h),
      child: Text(text,
          style: TextStyle(
              color: Colors.grey.withOpacity(0.7),
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
              wordSpacing: 3.sp)));
}

Widget buildTextField(String hintText, String textType, String iconName,
    void Function(String value)? func) {
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(bottom: 20.h),
    decoration: BoxDecoration(
        // color: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.all(Radius.circular(15.w)),
        border: Border.all(color: Colors.black26)),
    child: Row(
      children: [
        Container(
          width: 30.w,
          height: 30.w,
          margin: EdgeInsets.only(left: 10.w),
          child: Image.asset("assets/icons/$iconName.png"),
        ),
        Container(
          width: 270.w,
          height: 50.h,
          child: TextField(
            onChanged: (value)=> func!(value) ,
            maxLines: 1,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                hintText: hintText,
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5))),
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Avenir",
              fontWeight: FontWeight.normal,
              fontSize: 14.sp,
            ),
            autocorrect: false,
            obscureText: textType == "password" ? true : false,
          ),
        )
      ],
    ),
  );
}

Widget forgotPassword() {
  return Container(
    width: 300.w,
    height: 40.h,
    margin: EdgeInsets.only(left: 10.w),
    child: GestureDetector(
      onTap: () {},
      child: Text("Forgot Password",
          style: TextStyle(
              color: Colors.black,
              decoration: TextDecoration.underline,
              fontSize: 14.sp)),
    ),
  );
}

Widget buildLogInAndRegButton(String buttonName, String buttonType, void Function()? func) {
  return GestureDetector(
    onTap: func,
    child: Container(
        width: 325.w,
        height: 50.h,
        margin: EdgeInsets.only(
            left: 10.w, right: 10.w, top: buttonType == "login" ? 30.h : 20.h),
        decoration: BoxDecoration(
            color:
                buttonType == "login" ? AppColors.primaryElement : Colors.white,
            border: Border.all(
                color: buttonType == "login"
                    ? Colors.transparent
                    : AppColors.primaryFourElementText),
            borderRadius: BorderRadius.circular(15.w),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                  color: Colors.grey.withOpacity(0.1))
            ]),
        child: Center(
          child: Text(buttonName,
              style: TextStyle(
                color: buttonType == "login"
                    ? AppColors.primaryBackground
                    : AppColors.primaryText,
                fontSize: 18.sp,
                fontWeight: FontWeight.normal,
              )),
        )),
  );
}
