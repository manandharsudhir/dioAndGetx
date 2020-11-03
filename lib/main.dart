import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:salesmgmt/app/interceptors/AppInterceptors.dart';
import 'package:salesmgmt/app/utilis/env_utilis.dart';
import 'package:salesmgmt/domain/login/ui/login_view.dart';

import 'app/utilis/dio_utilis.dart';

final storage = FlutterSecureStorage();

void main() async {
  await loadEnvFile('assets/env/.env_dev');
  authorizationDio.interceptors.add(AppInterceptors());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginView(), navigatorKey: Get.key);
  }
}
