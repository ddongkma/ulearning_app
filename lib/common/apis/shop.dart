
import 'package:ulearning_app/common/entities/shop.dart';

import '../utils/http_util.dart';

class ShopApi {
  static Future<BranchDetailResponse?> getBranchs(
      { BranchDetailRequest? params}) async {
    var response = await HttpUtil().get('api/get-branch',
      queryParameters: params?.toJson(),
    );
    print(' course ${response}');
    if (response != null ) {
      return BranchDetailResponse.fromJson(response);
    } else {
      return null;
    }

  }
}