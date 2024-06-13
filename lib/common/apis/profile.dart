import 'package:ulearning_app/common/entities/entities.dart';
import 'package:ulearning_app/common/utils/http_util.dart';

import '../entities/profile.dart';

class CourseApi {
   static Future<SearchProfileResponse> searchProfile({SearchProfileRequest? params}) async {
    var response = await HttpUtil().get('api/audit/profile/search',
        data: params?.toJson()
    );
    print(' search profile : $response');
    return SearchProfileResponse.fromJson(response);
  }
  static Future<CourseDetailResponseEntity> courseDetail( { CourseRequestEntity? params}) async {
    var response = await HttpUtil().post('api/courseDetail',
      queryParameters: params?.toJson(),
    );
    print(' course ${response}');
    return CourseDetailResponseEntity.fromJson(response);
  }
  static Future<BaseResponseEntity> coursePay( { CourseRequestEntity? params}) async {
    var response = await HttpUtil().post('api/checkout',
      queryParameters: params?.toJson(),
    );
    return BaseResponseEntity.fromJson(response);
  }
}


