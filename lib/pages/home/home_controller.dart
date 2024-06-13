import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/apis/profile.dart';
import 'package:ulearning_app/common/apis/shop.dart';
import 'package:ulearning_app/common/entities/entities.dart';
import 'package:ulearning_app/common/entities/shop.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/home/bloc/home_bloc.dart';
import 'package:ulearning_app/pages/home/bloc/home_event.dart';

import '../../common/entities/staff.dart';

class HomeController{
  late BuildContext context;
  LoginRequest? get  userProfile => Global.storageService.getUserProfile();
  static final HomeController _singleton = HomeController._internal();
  HomeController._internal();

   factory HomeController({required BuildContext context}){
     _singleton.context = context;
     return _singleton;
   }
  Future<void> init() async {
    if(Global.storageService.getAccessToken().isNotEmpty && userProfile?.shopId != null){
      BranchDetailRequest branchDetailRequest = BranchDetailRequest(parentShopId: userProfile!.shopId);
      print(branchDetailRequest);
      var result = await ShopApi.getBranchs(params: branchDetailRequest);
      if(result !=null){
        if(context.mounted){
          print(result);
          context.read<HomeBloc>().add(HomePageGetBranchEvent(result.branches!));
        }
      }else{
        print(result);
      }
    } else{
      print("User has already logged out.");
    }
  }
  // Future<void>
}