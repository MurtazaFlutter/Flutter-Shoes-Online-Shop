import '../utils/exports.dart';

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

  bool _responseBool = false;
  bool get responseBool => _responseBool;
  set responseBool(bool newState) {
    _responseBool = newState;
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

    preferences.remove('Token');
    preferences.remove('userId');
    preferences.setBool('isLogged', false);
    loggedIn = preferences.getBool('isLogged') ?? false;
  }

  Future<bool> registerUser(SignupModel model) async {
    responseBool = await AuthHelper().signUp(model);

    return responseBool;
  }

  getPrefs() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    loggedIn = preferences.getBool("isLogged") ?? false;
  }
}
