import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:salesmgmt/app/services/auth/model/authentication_request.dart';
import 'package:salesmgmt/app/services/auth/model/authentication_response.dart';
import 'package:salesmgmt/app/services/auth/model/user.dart';
import 'package:salesmgmt/app/utilis/dio_utilis.dart';

class AuthService extends GetxController {
  Future<AuthenticationResponse> authenticate(
      AuthenticationRequest authenticationRequest) async {
    final response = await authenticationDio.post('/auth/authenticate',
        options: Options(headers: {"requireToken": false}),
        data: json.encode(authenticationRequest));
    return AuthenticationResponse.fromJson(response.data);
  }

  Future<User> authorize(String accessToken) async {
    authenticationDio.options.headers['Authorization'] = accessToken;
    final response = await authenticationDio.post('/auth/authorize');
    User user = User.fromJson(response.data);
    return user;
  }
}
