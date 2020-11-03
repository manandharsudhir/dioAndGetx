import 'package:dio/dio.dart';
import 'package:salesmgmt/main.dart';

class AppInterceptors extends Interceptor {
  @override
  Future<dynamic> onRequest(RequestOptions options) async {
    final String accessToken = await storage.read(key: 'accessToken');
    options.headers.addAll({"Authorization": accessToken});
    return options;
  }

  @override
  Future<dynamic> onError(DioError dioError) {
    return super.onError(dioError);
  }

  @override
  Future<dynamic> onResponse(Response response) async {
    return super.onResponse(response);
  }
}
