import 'package:flutter/material.dart';

import 'homepage.dart';
import 'navbar.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text('SOSYAL',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 34,
                  fontFamily: 'BadScript')),
          Column(
            children: const [
              CircleAvatar(
                radius: 70.0,
                backgroundImage: NetworkImage(
                    'https://i.pinimg.com/originals/3b/35/88/3b35884ed94f8efd003eafe8f86538b7.jpg'),
                backgroundColor: Colors.transparent,
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                'CemOfficial',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: RaisedButton(
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Giriş Yap',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.login,
                        color: Colors.white,
                      )
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Navbar()));
                  }),
            ),
          )
        ],
      ),
    );
  }
}
