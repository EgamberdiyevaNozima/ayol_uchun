import 'dart:developer';

import 'package:ayol_uchun_project/core/client.dart';
import 'package:ayol_uchun_project/core/secure_storage.dart';
import 'package:ayol_uchun_project/data/model/auth_model.dart';


class AuthRepository {
  final ApiClient client;

  AuthRepository({required this.client});

  String? jwt;
  //login function
  Future<bool> login(String login, String password) async {
    jwt = await client.login(login, password);
    await SecureStorage.deleteCredentials();
    await SecureStorage.deleteToken();
    await SecureStorage.saveToken(jwt!);
    await SecureStorage.saveCredentials(login, password);
    return true;
  }

  Future<bool> signUp({
    required String firstName,
    required String lastName,
    required String email,
    // required String phoneNumber,
    // required String password,
  }) async {
    log("error in signup repo");
    final result = await client.register(
      AuthModel(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phoneNumber: "nozima3", //unique
        password: "nozima3",
      ),
    );
    log("result: ${result.toString()}");
    return result;
  }


  Future<bool> refreshToken() async {
    var credentials = await SecureStorage.getCredentials();
    if (credentials['login'] == null || credentials['password'] == null) {
      return false;
    }
    jwt = await client.login(credentials['login']!, credentials['password']!);
    await SecureStorage.deleteToken();
    SecureStorage.saveToken(jwt!);
    return true;
  }

  // Future<void> logOut() async {
  //   await SecureStorage.deleteCredentials();
  //   await SecureStorage.deleteToken();
  // }
}