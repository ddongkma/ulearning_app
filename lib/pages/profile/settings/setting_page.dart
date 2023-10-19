import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/routes/names.dart';
import 'package:ulearning_app/common/values/constant.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/application/bloc/app_bloc.dart';
import 'package:ulearning_app/pages/application/bloc/app_event.dart';
import 'package:ulearning_app/pages/home/bloc/home_event.dart';
import 'package:ulearning_app/pages/profile/settings/bloc/setting_page_bloc.dart';
import 'package:ulearning_app/pages/profile/settings/bloc/setting_page_state.dart';
import 'package:ulearning_app/pages/profile/settings/widgets/setting_page_widgets.dart';

import '../../home/bloc/home_bloc.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  void removeUserData(){
    context.read<AppBloc>().add(const TriggerAppEvent(0));
    context.read<HomeBloc>().add( const HomeDotsEvent(0));
    Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    Global.storageService.remove(AppConstants.STORAGE_USER_PROFILE_KEY);
    Navigator.of(context).pushNamedAndRemoveUntil(PageRoutes.SIGN_IN, (route) => false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingPageBloc, SettingPageState>(
          builder: (context, state) => Container(
            child: Column(
              children: [
                settingsButton(context,removeUserData),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
