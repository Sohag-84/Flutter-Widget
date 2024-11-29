import 'package:shared_preferences/shared_preferences.dart';

class LocalPreferenceService {
  // Private constructor
  LocalPreferenceService._();

  // Singleton instance variable
  static final LocalPreferenceService _instance = LocalPreferenceService._();

  // Getter for the singleton instance
  static LocalPreferenceService get instance => _instance;

  // SharedPreferences object
  late SharedPreferences _prefs;

  // Initialize SharedPreferences
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  ///for get token
  String getToken() {
    return _prefs.getString("token") ?? '';
  }

  ///for set token
  Future<void> setToken({required String token}) async {
    await _prefs.setString('token', token);
  }

  ///for remove token
  Future<void> removeToken() async {
    await _prefs.remove("token");
  }

  ///for get user id
  int getUserId() {
    return _prefs.getInt("userId") ?? 0;
  }

  ///for set user id
  Future<void> setUserId({required int userId}) async {
    await _prefs.setInt('userId', userId);
  }

  ///for remove user id
  Future<void> removeUserId() async {
    await _prefs.remove("userId");
  }

  ///get username
  String getUsername() {
    return _prefs.getString("username") ?? '';
  }

  ///for set username
  Future<void> setUsername({required String username}) async {
    await _prefs.setString('username', username);
  }

  ///for remove username
  Future<void> removeUsername() async {
    await _prefs.remove("username");
  }

  ///for get user email
  String getEmail() {
    return _prefs.getString("email") ?? '';
  }

  ///for set email
  Future<void> setEmail({required String email}) async {
    await _prefs.setString('email', email);
  }

  ///for remove email
  Future<void> removeEmail() async {
    await _prefs.remove("email");
  }
}
