
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/entities/course.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/common/values/constant.dart';
import 'package:ulearning_app/pages/home/bloc/home_bloc.dart';
import 'package:ulearning_app/pages/home/bloc/home_event.dart';
import 'package:ulearning_app/pages/home/bloc/home_state.dart';

import '../../../common/widgets/base_text_widgets.dart';

AppBar buildAppBar(String avatar) {
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
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.w),
                  image: DecorationImage(
                    image:
                        NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/2048px-User-avatar.svg.png"),
                  )),
            ),
          )
        ],
      ),
    ),
  );
}

Widget homePageText(String text,
    {Color color = AppColors.primaryText, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(text,
        style: TextStyle(
          color: color,
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
        )),
  );
}

Widget searchView(BuildContext context) {
  return Row(
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
                // onChanged: (value)=> func!(value) ,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    hintText: "Search your profile...",
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
                obscureText: false,
                cursorColor: Colors.black12,
              ),
            )
          ],
        ),
      ),
      GestureDetector(
        onTap: () {
          _showFilterOptions(context);
        },
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
  );
}

void _showFilterOptions(BuildContext context) {
  TextEditingController shopcodeController = TextEditingController();
  TextEditingController isdnController = TextEditingController();
  String? selectedBranch;
  String? selectedStatus;

  List<String> branches = ['Branch 1', 'Branch 2', 'Branch 3']; // Danh sách các branch
  List<String> statuses = ['Active', 'Inactive', 'Pending']; // Danh sách các status

  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            padding: EdgeInsets.all(16.0),
            height: 500.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Search profile',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextField(
                  controller: shopcodeController,
                  decoration: InputDecoration(labelText: 'SHOPCODE'),
                ),
                TextField(
                  controller: isdnController,
                  decoration: InputDecoration(labelText: 'ISDN'),
                ),
                DropdownButton<String>(
                  hint: Text('Select Branch'),
                  value: selectedBranch,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedBranch = newValue!;
                    });
                  },
                  items: branches.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                DropdownButton<String>(
                  hint: Text('Select Status'),
                  value: selectedStatus,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedStatus = newValue!;
                    });
                  },
                  items: statuses.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Xử lý dữ liệu tìm kiếm
                    String shopcode = shopcodeController.text;
                    String isdn = isdnController.text;
                    String branch = selectedBranch ?? '';
                    String status = selectedStatus ?? '';

                    print('Shopcode: $shopcode');
                    print('ISDN: $isdn');
                    print('Branch: $branch');
                    print('Status: $status');

                    // Đóng BottomSheet
                    Navigator.pop(context);
                  },
                  child: Text('Search'),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

Widget slidersView(BuildContext context, HomeState state) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 375.w,
        height: 160.h,
        child: PageView(
          onPageChanged: (value) {
            context.read<HomeBloc>().add(HomeDotsEvent(value));
          },
          children: [
            _slidersContainer(),
            _slidersContainer(path: "assets/icons/image1.png"),
            _slidersContainer(path: "assets/icons/image2.png"),
          ],
        ),
      ),
      Container(
        child: DotsIndicator(
          dotsCount: 3,
          position: state.index,
          decorator: DotsDecorator(
              color: AppColors.primaryThreeElementText,
              size: Size.square(5.0),
              activeColor: AppColors.primaryElement,
              activeSize: Size(17.0, 5.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
        ),
      )
    ],
  );
}

Widget _slidersContainer({String path = "assets/icons/Art.png"}) {
  return Container(
    width: 375.w,
    height: 160.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.h)),
        image: DecorationImage(image: AssetImage(path), fit: BoxFit.fill)),
  );
}

Widget menuView() {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            reusableText("Results", fontSize: 20),
            GestureDetector(
                child: reusableText("See all",
                    color: AppColors.primaryThreeElementText, fontSize: 10)),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _reusableMenuText("All"),
            _reusableMenuText("Populer",
                boxColor: AppColors.primarySecondaryBackground,
                textColor: AppColors.primaryThreeElementText),
            _reusableMenuText("Newest",
                boxColor: AppColors.primarySecondaryBackground,
                textColor: AppColors.primaryThreeElementText),
          ],
        ),
      )
    ],
  );
}

Widget _reusableMenuText(String menuText,
    {Color boxColor = AppColors.primaryElement,
    Color textColor = AppColors.primaryElementText}) {
  return Container(
    margin: EdgeInsets.only(right: 7.w),
    decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(7.w),
        border: Border.all(color: boxColor)),
    padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h, bottom: 5.h),
    child: reusableText(menuText,
        color: textColor, fontWeight: FontWeight.normal, fontSize: 13),
  );
}

Widget courseGrid(CourseItem item) {
  return Container(
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.w),
        image: DecorationImage(
            image: NetworkImage(AppConstants.SERVER_UPLOADS + item.thumbnail!),
            fit: BoxFit.fill)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 5.w),
          decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white70, width: 1)),
          child: Text(
            item.name ?? "",
            maxLines: 1,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: TextStyle(
              color: AppColors.primaryElementText,
              fontWeight: FontWeight.bold,
              fontSize: 13.sp,
            ),
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          item.description ?? "",
          maxLines: 1,
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
          style: TextStyle(
            color: AppColors.primaryFourElementText,
            fontWeight: FontWeight.normal,
            fontSize: 10.sp,
          ),
        )
      ],
    ),
  );
}
