import 'package:get/get.dart';
import 'package:salesmgmt/app/services/auth/model/authentication_request.dart';
import 'package:salesmgmt/app/services/auth/model/authentication_response.dart';
import 'package:salesmgmt/app/services/auth/model/user.dart';
import 'package:salesmgmt/app/services/auth/service/auth_service.dart';
import 'package:salesmgmt/main.dart';

class LoginService extends GetxController {
  AuthService _authService = Get.put(AuthService());

  Future<AuthenticationResponse> authenticate(
      AuthenticationRequest authenticationRequest) async {
    AuthenticationResponse authenticationResponse =
        await _authService.authenticate(authenticationRequest);

    await setAccessTokenAndRefreshToken(authenticationResponse);

    return authenticationResponse;
  }

  Future<User> authorize(String accessToken) async {
    return await _authService.authorize(accessToken);
  }

  Future<void> setAccessTokenAndRefreshToken(
      AuthenticationResponse authenticationResponse) async {
    await storage.write(
        key: 'accessToken', value: authenticationResponse.accessToken);
    await storage.write(
        key: 'refreshToken', value: authenticationResponse.refreshToken);
  }
}
