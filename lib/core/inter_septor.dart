import 'package:ayol_uchun_project/core/routers/routes.dart';
import 'package:ayol_uchun_project/core/secure_storage.dart';
import 'package:ayol_uchun_project/data/repository/auth_repositories.dart';
import 'package:dio/dio.dart';
import 'package:ayol_uchun_project/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';



class AuthInterceptor extends Interceptor {
  final Dio _dio = Dio();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final jwt = await SecureStorage.getToken();
    if (jwt != null) {
      options.headers['Authorization'] = "Bearer $jwt";
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final result = await navigatorKey.currentContext!.read<AuthRepository>().refreshToken();
      if (result) {
        final jwt = await SecureStorage.getToken();
        err.requestOptions.headers['Authorization'] = "Bearer $jwt";
        return handler.resolve(
          await _dio.request(
            err.requestOptions.baseUrl + err.requestOptions.path,
            options: Options(
              method: err.requestOptions.method,
              headers: err.requestOptions.headers,
            ),
            data: err.requestOptions.data,
            queryParameters: err.requestOptions.queryParameters,
          ),
        );
      } else{
        await SecureStorage.deleteToken();
        navigatorKey.currentContext!.go(Routes.login);
        return handler.reject(err);
      }
    }
  }
}
