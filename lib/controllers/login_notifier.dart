import 'package:flutter/material.dart';
import 'package:online_shop/models/auth/login_model.dart';
import 'package:online_shop/services/auth_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginNotifier extends ChangeNotifier {
  bool _isObsecure = false;

  bool get isObsecure => _isObsecure;

  set isObsecure(bool newState) {
    _isObsecure = newState;
    notifyListeners();
  }

  bool _processing = false;
  bool get processing => _processing;
  set processing(bool newState) {
    _processing = newState;
    notifyListeners();
  }

  bool _loginResponseBool = false;
  bool get loginResponseBool => _loginResponseBool;
  set loginResponseBool(bool newState) {
    _loginResponseBool = newState;
    notifyListeners();
  }

  bool? _isLoggedIn;
  bool get loggedIn => _isLoggedIn ?? false;
  set loggedIn(bool newState) {
    _isLoggedIn = newState;
    notifyListeners();
  }

  Future<bool> userlogin(LoginModel model) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    processing = true;
    bool response = await AuthHelper().login(model);
    processing = false;

    loginResponseBool = response;

    loggedIn = prefs.getBool('isLogged') ?? false;

    return loginResponseBool;
  }

  logout() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.remove('token');
    preferences.remove('userId');
    preferences.setBool('isLogged', false);
    loggedIn = preferences.getBool('isLogged') ?? false;
  }
}
