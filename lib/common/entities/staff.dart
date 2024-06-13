class LoginRequest {
  int? staffId;
  int? shopId;
  String? userName;
  String? createDate;
  String? updateDate;
  String? birthDay;
  String? startDate;
  String? fullName;
  String? tel;
  String? staffCode;
  String? email;
  String? address;
  String? gender;
  String? password;
  String? accessToken;

  LoginRequest({
    this.staffId,
    this.shopId,
    this.userName,
    this.createDate,
    this.updateDate,
    this.birthDay,
    this.startDate,
    this.fullName,
    this.tel,
    this.staffCode,
    this.email,
    this.address,
    this.gender,
    this.password,
    this.accessToken
  });
  factory LoginRequest.fromJson(Map<String, dynamic> json) {
    return LoginRequest(
      staffId: json['staff_id'],
      shopId: json['shop_id'],
      userName: json['user_name'],
      createDate: json['create_date'],
      updateDate: json['update_date'],
      birthDay: json['birth_day'],
      startDate: json['start_date'],
      fullName: json['full_name'],
      tel: json['tel'],
      staffCode: json['staff_code'],
      email: json['email'],
      address: json['address'],
      gender: json['gender'],
      accessToken: json['access_token'],  // Ensure this matches your API response
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'staff_id': staffId,
      'shop_id': shopId,
      'user_name': userName,
      'create_date': createDate,
      'update_date': updateDate,
      'birth_day': birthDay,
      'start_date': startDate,
      'full_name': fullName,
      'tel': tel,
      'staff_code': staffCode,
      'email': email,
      'address': address,
      'gender': gender,
      'access_token': accessToken,
    };
  }
   Map<String, dynamic> toJson1() => {
     "email":email,
     "password" :password
   };

}