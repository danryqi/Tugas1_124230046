import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:login/screens/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameC = TextEditingController();
  final passwordC = TextEditingController();

  bool isLoginSuccess = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("login page"), centerTitle: true),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_usernameField(), _passField(), _btnLogin(context)],
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: usernameC,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          hintText: "Username...",
          hintStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          fillColor: Colors.pinkAccent,
          filled: true,
        ),
      ),
    );
  }

  Widget _passField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: passwordC,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Password...",
          hintStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          fillColor: Colors.pinkAccent,
          filled: true,
        ),
      ),
    );
  }

  Widget _btnLogin(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          _login(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: (isLoginSuccess) ? Colors.blue : Colors.red,
        ),
        child: Text(
          "LOGIN",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void _login(BuildContext context) {
    log("LOGIN");
    String username, password;
    String text = "";
    username = usernameC.text.trim();
    password = passwordC.text.trim(); //buat ngilangin spasi diawal
    log("Username : $username");
    log("password : $password");
    if (password == "1234") {
      //loginberhasil
      setState(() {
        text = "login berhasil";
        isLoginSuccess = true;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context){
              return HomePage(username: username,);
            }
          )
        );
      });
    } else {
      //logingagal
      setState(() {
        text = "login gagal";
        isLoginSuccess = false;
      });
    }
    SnackBar snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}