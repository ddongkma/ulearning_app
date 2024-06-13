import 'package:ulearning_app/common/entities/entities.dart';
import 'package:ulearning_app/common/utils/http_util.dart';

import '../entities/staff.dart';

class UserAPI{
    static login({LoginRequest? params}) async {
      var response = await HttpUtil().post(
      'login',
    data: params?.toJson1()
      );
      print("response: ${response}");
      if (response != null && response['staff_id'] != null) {
        return LoginRequest.fromJson(response);
      } else {
        return null;
      }
    }
}