import 'package:dusyeriinstagram/locator.dart';
import 'package:dusyeriinstagram/models/login.viewmodel.dart';
import 'package:dusyeriinstagram/models/user.dart';
import 'package:dusyeriinstagram/services/network.service.dart';
import 'package:dusyeriinstagram/views/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class AccountService {
  User? _user;
  AccountService();

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

  void logout(BuildContext context) async {
    showDialog(
        context: context,
        builder: (a) => AlertDialog(
              title: const Text("Uyarı!"),
              content: const Text(
                  "Oturumunuz kapatılacaktır. Devam etmek istiyor musunuz?"),
              actions: [
                ElevatedButton(
                    onPressed: (() {
                      Navigator.pop(context, false);
                    }),
                    child: const Text("İptal")),
                ElevatedButton(
                    onPressed: (() {
                      Navigator.pop(context, true);
                    }),
                    child: const Text("Devam")),
              ],
            )).then((value) async {
      if (value) {
        final prefs = await SharedPreferences.getInstance();
        _user = null;
        prefs.remove('user');
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginPage()),
            (route) => false);
      }
    });
  }

  Future<bool> updateAvatar() async {
    debugPrint('$url/files/updateavatar');
    final imagePicker = ImagePicker();
    final file = await imagePicker.pickImage(source: ImageSource.gallery);
    final request =
        http.MultipartRequest("POST", Uri.parse('$url/files/updateavatar'));
    //request.headers.addAll({'authorization': 'Bearer ${_user!.token}'});
    request.files.add(await http.MultipartFile.fromPath("file", file!.path));
    return request.send().then((value) {
      debugPrint(value.statusCode.toString());
      return true;
    }).catchError((err) {
      debugPrint(err.message);
      return false;
    });
  }
}
