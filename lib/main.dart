import 'package:flutter/material.dart';
import 'package:teste/views/login_page.dart';
import 'package:teste/views/register_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        '/register/': (context) => const RegisterPage(),
      },
    );
  }
}
