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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 🎮 background gradient
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.videogame_asset,
                  size: 80, color: Colors.cyanAccent),
              const SizedBox(height: 10),
              const Text(
                "GEMANIA",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyanAccent,
                ),
              ),
              const SizedBox(height: 40),
              _usernameField(),
              _passField(),
              _btnLogin(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
      child: TextFormField(
        controller: usernameC,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person, color: Colors.cyanAccent),
          hintText: "Enter Username",
          hintStyle: const TextStyle(color: Colors.white70),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.cyanAccent, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.purpleAccent, width: 2),
          ),
          filled: true,
          fillColor: Colors.black.withOpacity(0.4),
        ),
      ),
    );
  }

  Widget _passField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
      child: TextFormField(
        controller: passwordC,
        obscureText: true,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock, color: Colors.cyanAccent),
          hintText: "Enter Password",
          hintStyle: const TextStyle(color: Colors.white70),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.cyanAccent, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.purpleAccent, width: 2),
          ),
          filled: true,
          fillColor: Colors.black.withOpacity(0.4),
        ),
      ),
    );
  }

  Widget _btnLogin(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          _login(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.cyanAccent, // 🎨 tombol senada
          shadowColor: Colors.cyanAccent,
          elevation: 12,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        child: const Text(
          "LOGIN",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  void _login(BuildContext context) {
    log("LOGIN");
    String username = usernameC.text.trim();
    String password = passwordC.text.trim();

    log("Username : $username");
    log("Password : $password");

    String text = "";

    if (password == "1234") {
      text = "Login berhasil ✅";
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomePage(username: username);
          },
        ),
      );
    } else {
      text = "Login gagal ❌";
    }

    SnackBar snackBar = SnackBar(
      backgroundColor: Colors.black87,
      content: Text(
        text,
        style: const TextStyle(
          color: Colors.cyanAccent,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
