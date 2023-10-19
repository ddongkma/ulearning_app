import 'package:ulearning_app/common/entities/course.dart';
import 'package:ulearning_app/common/entities/entities.dart';
import 'package:ulearning_app/common/utils/http_util.dart';

class CourseApi {
  static Future<CourseListResponseEntity> courseList() async {
    var response = await HttpUtil().post('api/courseList');
    print(' course ${response}');
    return CourseListResponseEntity.fromJson(response);
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

