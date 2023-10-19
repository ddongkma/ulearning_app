import 'package:ulearning_app/common/entities/entities.dart';
import 'package:ulearning_app/common/utils/http_util.dart';

class UserAPI{
    static login({LoginRequestEntity? params}) async {
      var response = await HttpUtil().post(
      'api/login',
    queryParameters: params?.toJson()
      );
      print("response: ${response}");
      return UserLoginResponseEntity.fromJson(response);
    }
}