import 'package:dusyeriinstagram/models/user.dart';
import 'package:dusyeriinstagram/services/auth.service.dart';
import 'package:dusyeriinstagram/views/homepage.dart';
import 'package:dusyeriinstagram/views/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  final authService = locator<AuthService>();
  final prefs = await SharedPreferences.getInstance();
  final userData = prefs.getString("user");
  if (userData != null) {
    authService.fromJson(userData);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  final authService = locator<AuthService>();
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: authService.isAuthenticated ? const HomePage() : LoginPage());
  }
}
