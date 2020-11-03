import 'package:auto_route/auto_route_annotations.dart';
import 'package:salesmgmt/domain/login/ui/login_view.dart';
import 'package:salesmgmt/domain/sales/ui/sales_view.dart';

@MaterialAutoRouter(routes: [
  MaterialRoute(page: LoginView, initial: true),
  MaterialRoute(page: SalesView, path: '/sales')
])
class $Router {}
