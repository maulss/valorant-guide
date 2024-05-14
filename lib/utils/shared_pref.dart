import 'package:shared_preferences/shared_preferences.dart';
import 'package:valorant_documentation/model/user.dart';

String _usernameKey = 'username';
String _passwordKey = 'password';
String _emailKey = 'email';

class SharedPref {
  static void saveUserModel(
      {required String username,
      required String password,
      required String email}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_usernameKey, username);
    prefs.setString(_emailKey, email);
    prefs.setString(_passwordKey, password);
  }

  static Future<UserModel?> getUserModel() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final username = prefs.getString(_usernameKey);
    final email = prefs.getString(_emailKey);
    final password = prefs.getString(_passwordKey);
    return UserModel(username: username, password: password, email: email);
  }

  static void deleteKeyToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
