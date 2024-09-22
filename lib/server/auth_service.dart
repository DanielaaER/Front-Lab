import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api.dart';

class AuthService with ChangeNotifier {
  final String url = '${GlobalVariables().url}';
  static int? userId;

  static String? userFullName;

  static String? userEmail;
  static bool? log;

  final _storage = SharedPreferences.getInstance();
  bool _autenticando = false;
  bool _isLoggedIn = false;

  bool get autenticando => _autenticando;

  bool get isLoggedIn => _isLoggedIn;

  set autenticando(bool valor) {
    _autenticando = valor;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      return false; // Retorna false si alguno de los campos está vacío
    }
    try {
      print("url");
      print(url);
      final response = await Dio().post(
        '${url}login',
        data: {
          'email': email,
          'password': password,
        },
        options: Options(
          headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        ),
      );

      // print(response.statusCode);
      print(response.data);
      final data = response.data;
      if (data['status'] == 200) {
        userFullName = data['username'];
        log = true;
        _isLoggedIn = true;
        final preferences = await _storage;
        await preferences.setBool('isLoggedIn', true);
        await preferences.setBool('log', true);
        await preferences.setString('userFullName', userFullName!);
        print("logeo");
      } else {
        _isLoggedIn = false;
      }

      notifyListeners(); // Notificar a los listeners del cambio en _isLoggedIn
      // return _isLoggedIn;
      return true;
    } catch (e) {
      print('Error during login request: $e');
      // return false;
      return true;
    }
  }

  Future<bool> register(String email, String password, String name) async {
    if (email.isEmpty || password.isEmpty) {
      return false;
    }
    try {
      final response = await Dio().post(
        '${url}signup',
        data: {
          'email': email,
          'password': password,
          'name': name,
        },
        options: Options(
          headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        ),
      );

      // print(response.statusCode);
      print(response.data);
      final data = response.data;
      if (data['status'] == 200) {
        userFullName = data['name'];
        userEmail = data['email'];
        log = true;
        _isLoggedIn = true;
        final preferences = await _storage;
        await preferences.setBool('isLoggedIn', true);
        await preferences.setBool('log', true);
        await preferences.setString('userFullName', userFullName!);
        await preferences.setString('userEmail', userEmail!);
        print("register");
      } else {
        _isLoggedIn = false;
      }

      notifyListeners();
      return _isLoggedIn;
    } catch (e) {
      print('Error during login request: $e');
      return false;
    }
  }

  Future<void> checkLoginStatus() async {
    final preferences = await _storage;
    _isLoggedIn = preferences.getBool('isLoggedIn') ?? false;
    notifyListeners();
  }

  Future<void> logout() async {
    userId = null;
    userFullName = null;
    userEmail = null;
    log = null;
    _isLoggedIn = false;
    final preferences = await _storage;
    await preferences.remove('isLoggedIn');
    await preferences.remove('log');
    await preferences.remove('userId');
    await preferences.remove('userFullName');
    await preferences.remove('userEmail');
    notifyListeners();
  }
}
