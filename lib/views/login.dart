import 'package:dusyeriinstagram/locator.dart';
import 'package:dusyeriinstagram/models/login.viewmodel.dart';
import 'package:dusyeriinstagram/services/account.service.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';
import 'navbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final loginViewModel =
      LoginViewModel(userName: 'admin@cmosteknoloji.com', password: '!Cmos1234');
  final accountService = locator<AccountService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('SOSYAL',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 34,
                    fontFamily: 'BadScript')),
            const CircleAvatar(
              child: Icon(
                Icons.person_outline,
                size: 140,
                color: Colors.white,
              ),
              backgroundColor: Colors.grey,
              radius: 90,
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      initialValue: loginViewModel.userName,
                      onChanged: (value) => loginViewModel.userName = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'e-posta boş bırakılamaz!';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      initialValue: loginViewModel.password,
                      onChanged: (value) => loginViewModel.password = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'parola boş bırakılamaz!';
                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await accountService
                                .login(context, loginViewModel)
                                .then((value) {
                              if (value!) {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Navbar()));
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.warning,
                                        color: Colors.red,
                                      ),
                                      Text(
                                        "Geçersiz kullanıcı girişi!",
                                        style: TextStyle(color: Colors.red),
                                      )
                                    ],
                                  ),
                                  backgroundColor: Colors.black,
                                ));
                              }
                            });
                          }
                        },
                        child: const Text('Submit')),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
