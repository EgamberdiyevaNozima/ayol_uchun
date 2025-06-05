import 'dart:developer';
import 'package:ayol_uchun_project/main.dart';
import 'package:dio/dio.dart';
import 'exceptions/custom_Exception.dart';
import 'inter_septor.dart';

class ApiClient {
  static Dio get dio => _dio;

  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.148.64:8888/api/v1/',
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  )..interceptors.add(AuthInterceptor());


  //login client
  Future<String> login(String login, String password) async {
    var response = await dio.post(
      "/auth/login",
      data: {"login": login, "password": password},
    );
    if (response.statusCode == 200) {
      var data = Map<String, String>.from(response.data);
      return data['accessToken']!;
    } else {
      throw Exception("Nimadir xato ketdi");
    }
  }

  //register client
  Future<bool> register(model) async {
    log("error in client register");
    final response = await dio.post(
      '/auth/register',
      options: Options(
        headers: {
          'accept': 'text/plain',
          'Content-Type': 'application/json',
        },
      ),
      data: model.toJson(),
    );
    log("malumot bor ${response.data}");
    return response.statusCode == 201;
  }

  Future<List<dynamic>> fetchHomeCategories() async {
    try {
      final response = await dio.get(
        '/categories/list?Limit=9&Page=1',
        options: Options(
          headers: {
            'accept': 'text/plain',
            'Authorization': 'Bearer $token'
          },
        ),
      );
      if (response.statusCode == 200) {
        final List data = response.data as List;
        return data;
      } else {
        throw CustomException(message: "Xato: ${response.statusMessage ?? 'product kelmadi'}");
      }
    } catch (e) {
      throw CustomException(message: "API xatosi: ${e.toString()}");
    }
  }
  Future<List<dynamic>> fetchHomeInterviews() async {
    try {
      final response = await dio.get(
        '/interviews/list',
        options: Options(
          headers: {
            'accept': 'text/plain',
            'Authorization': 'Bearer $token'
          },
        ),
      );
      if (response.statusCode == 200) {
        final List data = response.data as List;
        return data;
      } else {
        throw CustomException(message: "Xato: ${response.statusMessage ?? 'product kelmadi'}");
      }
    } catch (e) {
      throw CustomException(message: "API xatosi: ${e.toString()}");
    }
  }

  Future<List<dynamic>> fetchHomeSocialAccounts() async {
    try {
      final response = await dio.get(
        '/social-accounts/list',
        options: Options(
          headers: {
            'accept': 'text/plain',
            'Authorization': 'Bearer $token'
          },
        ),
      );
      if (response.statusCode == 200) {
        final List data = response.data as List;
        return data;
      } else {
        throw CustomException(message: "Xato: ${response.statusMessage ?? 'product kelmadi'}");
      }
    } catch (e) {
      throw CustomException(message: "API xatosi: ${e.toString()}");
    }
  }

    Future<List<dynamic>> fetchAllCourses() async {
    try {
      final response = await dio.get(
        '/courses/list',
        options: Options(
          headers: {
            'accept': 'text/plain',
            'Authorization': 'Bearer $token'
          },
        ),
      );
      if (response.statusCode == 200) {
        final List data = response.data as List;
        return data;
      } else {
        throw CustomException(message: "Xato: ${response.statusMessage ?? 'product kelmadi'}");
      }
    } catch (e) {
      throw CustomException(message: "API xatosi: ${e.toString()}");
    }
  }
}
