class Shop {
  int? shopId;
  int? parentShopId;
  int? status;
  String? name;
  String? tel;
  String? shopCode;
  String? address;
  String? description;
  DateTime? createDate;
  DateTime? updateDate;
  DateTime? startDate;

  Shop({
    this.shopId,
    this.parentShopId,
    this.status,
    this.name,
    this.tel,
    this.shopCode,
    this.address,
    this.description,
    this.createDate,
    this.updateDate,
    this.startDate,
  });

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
      shopId: json['shopId'],
      parentShopId: json['parentShopId'],
      status: json['status'],
      name: json['name'],
      tel: json['tel'],
      shopCode: json['shopCode'],
      address: json['address'],
      description: json['description'],
      createDate: json['createDate'] != null ? DateTime.parse(json['createDate']) : null,
      updateDate: json['updateDate'] != null ? DateTime.parse(json['updateDate']) : null,
      startDate: json['startDate'] != null ? DateTime.parse(json['startDate']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'shopId': shopId,
      'parentShopId': parentShopId,
      'status': status,
      'name': name,
      'tel': tel,
      'shopCode': shopCode,
      'address': address,
      'description': description,
      'createDate': createDate?.toIso8601String(),
      'updateDate': updateDate?.toIso8601String(),
      'startDate': startDate?.toIso8601String(),
    };
  }
}

class BranchDetailEntity {
  int? shopId;
  int? parentShopId;
  String? name;
  String? shopCode;

  BranchDetailEntity({
    this.shopId,
    this.parentShopId,
    this.name,
    this.shopCode
  });

  factory BranchDetailEntity.fromJson(Map<String, dynamic> json) {
    return BranchDetailEntity(
      shopId: json['shopId'],
      parentShopId: json['parentShopId'],
      name: json['name'],
      shopCode: json['shopCode']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'shopId': shopId,
      'parentShopId': parentShopId,
      'name': name,
      'shopCode': shopCode
    };
  }
}
class BranchDetailResponse {
  List<BranchDetailEntity>? branches;
  BranchDetailResponse({
    this.branches
  });

  factory BranchDetailResponse.fromJson(Map<String, dynamic> json) =>
      BranchDetailResponse(
        branches: json["branches"] == null
            ? []
            : List<BranchDetailEntity>.from(
            json["branches"].map((x) => BranchDetailEntity.fromJson(x))),
      );
}

class BranchDetailRequest {

  int? parentShopId;

  BranchDetailRequest({
    this.parentShopId,
  });

  factory BranchDetailRequest.fromJson(Map<String, dynamic> json) {
    return BranchDetailRequest(
        parentShopId: json['parentShopId']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'parentShopId': parentShopId
    };
  }
}
