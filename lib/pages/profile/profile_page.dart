import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/profile/profile_controller.dart';
import 'package:ulearning_app/pages/profile/widgets/profile_page_widgets.dart';

import '../../common/entities/staff.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late LoginRequest userProfile;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    userProfile = ProfileController(context: context).userProfile!;
    print("userProfile ${userProfile.staffCode}");
    // userProfile = null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              profileIconAndEditButton(),
              SizedBox(height: 20.h,),
              Text("${userProfile.fullName}"),
              SizedBox(height: 20.h,),
              buildListContax(),
              SizedBox(height: 40.h,),
              Padding(
                padding:  EdgeInsets.only(left: 25.w),
                child: buildListView(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
