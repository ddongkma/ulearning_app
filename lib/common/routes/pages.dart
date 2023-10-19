


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/routes/names.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/application/application_page.dart';
import 'package:ulearning_app/pages/application/bloc/app_bloc.dart';
import 'package:ulearning_app/pages/home/bloc/home_bloc.dart';
import 'package:ulearning_app/pages/home/home_page.dart';
import 'package:ulearning_app/pages/profile/bloc/profile_page_bloc.dart';
import 'package:ulearning_app/pages/profile/profile_page.dart';
import 'package:ulearning_app/pages/profile/settings/bloc/setting_page_bloc.dart';
import 'package:ulearning_app/pages/profile/settings/setting_page.dart';
import 'package:ulearning_app/pages/register/bloc/register_bloc.dart';
import 'package:ulearning_app/pages/register/register.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:ulearning_app/pages/sign_in/sign_in.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_bloc.dart';
import 'package:ulearning_app/pages/welcome/welcome.dart';

class AppPages {
  static List<PageEntity> routes(){
    return  [
      PageEntity(
          route: PageRoutes.INITIAL,
          page: const Welcome(),
          bloc: BlocProvider(create: (_)=> WelcomeBloc())
      ),
      PageEntity(
          route: PageRoutes.SIGN_IN,
          page: const SignIn(),
          bloc: BlocProvider(create: (_)=> SignInBloc())
      ),
      PageEntity(
          route: PageRoutes.REGISTER,
          page: const Register(),
          bloc: BlocProvider(create: (_)=> RegisterBloc())
      ),
      PageEntity(
          route: PageRoutes.APPLICATION,
        page: const ApplicationPage(),
        bloc: BlocProvider(create: (_)=> AppBloc())
      ),
      PageEntity(
          route: PageRoutes.HOME,
          page: const HomePage(),
          bloc: BlocProvider(create: (_)=> HomeBloc())
      ),
      PageEntity(
          route: PageRoutes.PROFILEPAGE,
          page: const ProfilePage(),
          bloc: BlocProvider(create: (_)=> ProfilePageBloc())
      ),
      PageEntity(
          route: PageRoutes.SETTINGSPAGE,
          page: const SettingPage(),
          bloc: BlocProvider(create: (_)=> SettingPageBloc())
      ),
    ];
  }
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic> [];
    for(var bloc in routes()){
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }
  static MaterialPageRoute GenerateRouteSettings (RouteSettings settings){

    if(settings.name!= null){
      var result = routes().where((element) => element.route==settings.name);
      if(result.isNotEmpty){
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if(result.first.route==PageRoutes.INITIAL&& deviceFirstOpen){
          bool isLoggedIn = Global.storageService.getIsLoggedIn();
          if(isLoggedIn){
            return MaterialPageRoute(builder: (_)=>const ApplicationPage(), settings: settings);
          }

          return MaterialPageRoute(builder: (_)=>const SignIn(), settings: settings);
        }
        return MaterialPageRoute(builder: (_)=>result.first.page,settings: settings);
      }
    }
    return MaterialPageRoute(builder: (_)=>const SignIn(), settings: settings);
  }
}

class PageEntity{
  String route;
  Widget page;
  dynamic bloc;
  PageEntity({required this.route, required this.page, this.bloc});
}