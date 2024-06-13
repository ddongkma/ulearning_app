import 'package:dio/dio.dart';

import '../entities/staff.dart';


class AuthService {
  final Dio _dio = Dio();
  final String baseUrl = "http://localhost:9091/api"; // URL của API Spring Boot

  Future<LoginRequest?> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '$baseUrl/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return LoginRequest.fromJson(response.data);
      } else {
        print('Failed to login');
        return null;
      }
    } on DioError catch (e) {
      print('Dio error: ${e.message}');
      return null;
    }
  }
}