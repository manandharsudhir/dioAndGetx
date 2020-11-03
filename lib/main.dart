import 'package:flutter/material.dart';
import 'package:salesmgmt/app/router/router.gr.dart' as router;
import 'package:salesmgmt/app/utilis/env_utilis.dart';

void main() async {
  await loadEnvFile('assets/env/.env_dev');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: router.Routes.loginView,
      onGenerateRoute: router.Router().onGenerateRoute,
    );
  }
}
