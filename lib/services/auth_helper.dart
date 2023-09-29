import 'package:http/http.dart' as http;
import '../utils/exports.dart';

class AuthHelper {
  static var client = http.Client();

  Future<bool> login(LoginModel model) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var url = Uri.http(Config.apiUrl, Config.loginUrl);

    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));

    if (response.statusCode == 200) {
      debugPrint("body ${response.body}");
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();

      String userToken = loginResponseModelFromJson(response.body).token;
      String userId = loginResponseModelFromJson(response.body).id;

      await preferences.setString('Token', userToken);
      await preferences.setString('userId', userId);
      await preferences.setBool("isLogged", true);

      return true;
    } else {
      return false;
    }
  }

  Future<bool> signUp(SignupModel model) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var url = Uri.http(Config.apiUrl, Config.signUpUrl);

    var response = await client.post(url,
        body: jsonEncode(model.toJson()), headers: requestHeaders);

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<ProfileRes> getUserProfile() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('Token');
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Token': 'Bearer $token'
    };

    var url = Uri.http(Config.apiUrl, Config.getUser);

    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var profile = profileResFromJson(response.body);

      return profile;
    } else {
      throw Exception(" Failed to get profile");
    }
  }
}
