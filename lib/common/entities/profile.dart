class ProfileEntity {
   int? id;
   int? subId;
   DateTime? subDateTime;
   String? isdn;
   int? cusId;
   int? contractId;
   int? dbType;
   int? typeActionId;
   String? productCode;
   int? actionAuditId;
   String? actionCode;
   int? reasonId;
   String? reasonName;
   DateTime? actionDatetime;
   String? actionDescription;
   String? userCollect;
   String? shopCollect;
   String? operationCode;
   int? numFile;
   int? isDigitalFile;
   int? fingerId;
   int? isFullFile;
   int? actionStatus;
   int? auditReview;
   DateTime? createDate;
   DateTime? updateDate;
   String? branchCode;

  ProfileEntity({
     this.id,
     this.subId,
     this.subDateTime,
     this.isdn,
     this.cusId,
     this.contractId,
     this.dbType,
     this.typeActionId,
     this.productCode,
     this.actionAuditId,
     this.actionCode,
     this.reasonId,
     this.reasonName,
     this.actionDatetime,
     this.actionDescription,
     this.userCollect,
     this.shopCollect,
     this.operationCode,
     this.numFile,
     this.isDigitalFile,
     this.fingerId,
     this.isFullFile,
     this.actionStatus,
     this.auditReview,
     this.createDate,
     this.updateDate,
     this.branchCode,
  });

  factory ProfileEntity.fromJson(Map<String, dynamic> json) {
    return ProfileEntity(
      id: json['id'],
      subId: json['subId'],
      subDateTime: DateTime.parse(json['subDateTime']),
      isdn: json['isdn'],
      cusId: json['cusId'],
      contractId: json['contractId'],
      dbType: json['dbType'],
      typeActionId: json['typeActionId'],
      productCode: json['productCode'],
      actionAuditId: json['actionAuditId'],
      actionCode: json['actionCode'],
      reasonId: json['reasonId'],
      reasonName: json['reasonName'],
      actionDatetime: DateTime.parse(json['actionDatetime']),
      actionDescription: json['actionDescription'],
      userCollect: json['userCollect'],
      shopCollect: json['shopCollect'],
      operationCode: json['operationCode'],
      numFile: json['numFile'],
      isDigitalFile: json['isDigitalFile'],
      fingerId: json['fingerId'],
      isFullFile: json['isFullFile'],
      actionStatus: json['actionStatus'],
      auditReview: json['auditReview'],
      createDate: DateTime.parse(json['createDate']),
      updateDate: DateTime.parse(json['updateDate']),
      branchCode: json['branchCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'subId': subId,
      'subDateTime': subDateTime?.toIso8601String(),
      'isdn': isdn,
      'cusId': cusId,
      'contractId': contractId,
      'dbType': dbType,
      'typeActionId': typeActionId,
      'productCode': productCode,
      'actionAuditId': actionAuditId,
      'actionCode': actionCode,
      'reasonId': reasonId,
      'reasonName': reasonName,
      'actionDatetime': actionDatetime?.toIso8601String(),
      'actionDescription': actionDescription,
      'userCollect': userCollect,
      'shopCollect': shopCollect,
      'operationCode': operationCode,
      'numFile': numFile,
      'isDigitalFile': isDigitalFile,
      'fingerId': fingerId,
      'isFullFile': isFullFile,
      'actionStatus': actionStatus,
      'auditReview': auditReview,
      'createDate': createDate?.toIso8601String(),
      'updateDate': updateDate?.toIso8601String(),
      'branchCode': branchCode,
    };
  }

}

class SearchProfileRequest {
  String? isdn;
  int? documentNo;
  int? type;
  String? shopCode;
  int? status;
  int? subStatus;
  String? uploadUser;
  String? fromDate;
  String? toDate;
  int? auditReview;
  String? branchCode;

  SearchProfileRequest({
    this.isdn,
    this.documentNo,
    this.type,
    this.shopCode,
    this.status,
    this.subStatus,
    this.uploadUser,
    this.fromDate,
    this.toDate,
    this.auditReview,
    this.branchCode,
  });

  factory SearchProfileRequest.fromJson(Map<String, dynamic> json) {
    return SearchProfileRequest(
      isdn: json['isdn'],
      documentNo: json['documentNo'],
      type: json['type'],
      shopCode: json['shopCode'],
      status: json['status'],
      subStatus: json['subStatus'],
      uploadUser: json['uploadUser'],
      fromDate: json['fromDate'],
      toDate: json['toDate'],
      auditReview: json['auditReview'],
      branchCode: json['branchCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isdn': isdn,
      'documentNo': documentNo,
      'type': type,
      'shopCode': shopCode,
      'status': status,
      'subStatus': subStatus,
      'uploadUser': uploadUser,
      'fromDate': fromDate,
      'toDate': toDate,
      'auditReview': auditReview,
      'branchCode': branchCode,
    };
  }
}

class SearchProfileResponse {
  List<ProfileEntity>? profiles;
  SearchProfileResponse({
    this.profiles
  });

  factory SearchProfileResponse.fromJson(Map<String, dynamic> json) =>
      SearchProfileResponse(
        profiles: json["profiles"] == null
            ? []
            : List<ProfileEntity>.from(
            json["profiles"].map((x) => ProfileEntity.fromJson(x))),
      );
}


