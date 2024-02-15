import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:teste/firebase_options.dart';
import 'package:teste/views/login_page.dart';
import 'package:teste/views/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
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
        '/login/': (context) => LoginPage(),
      },
    );
  }
}
