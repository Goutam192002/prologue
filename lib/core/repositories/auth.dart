import 'package:dio/dio.dart';
import 'package:prologue/core/constants.dart';

class AuthRepository {
  Dio _dio = new Dio();

  authenticate(String mobileNumber) async {
    var response = await _dio
        .post('$BASE_API_URL/auth/', data: {"mobile_number": mobileNumber});
  }

  verifyCode(String mobileNumber, String code) async {
    var response = await _dio.post(
      '$BASE_API_URL/auth/verify/',
      data: {"mobile_number": mobileNumber, "code": code},
    );
  }
}
