import 'package:dusyeriinstagram/locator.dart';
import 'package:dusyeriinstagram/models/login.viewmodel.dart';
import 'package:dusyeriinstagram/models/user.dart';
import 'package:dusyeriinstagram/services/network.service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  User? _user;
  AuthService();

  User? get currentUser => _user;
  bool get isAuthenticated => _user != null;

  void fromJson(String json) {
    _user = User.fromJson(json);
  }

  Future<bool> login(LoginViewModel model) async {
    final network = locator<NetworkService>();
    final result = await network.post("account/token", model);
    if (result.statusCode == 200) {
      _user = User.fromJson(result.body!);
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('user', result.body!);
      return true;
    } else {
      return false;
    }
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    _user = null;
    prefs.remove('user');
  }
}
