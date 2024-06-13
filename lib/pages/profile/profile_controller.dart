import 'package:flutter/cupertino.dart';

import '../../common/entities/staff.dart';
import '../../global.dart';

class ProfileController {
  late BuildContext context;
  LoginRequest? get  userProfile => Global.storageService.getUserProfile();
  static final ProfileController _singleton = ProfileController._internal();
  ProfileController._internal();

  factory ProfileController({required BuildContext context}){
    _singleton.context = context;
    return _singleton;
  }
}