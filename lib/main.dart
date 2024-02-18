import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:teste/firebase_options.dart';
import 'package:teste/views/create_note.dart';
import 'package:teste/views/login/auth_page.dart';
import 'package:teste/views/home_page.dart';
import 'package:teste/views/login/login_page.dart';
import 'package:teste/views/login/register_page.dart';

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
      home: const AuthPage(),
      routes: {
        '/auth-page/': (context) => const AuthPage(),
        '/register/': (context) => const RegisterPage(),
        '/login/': (context) => const LoginPage(),
        '/home/': (context) => const HomePage(),
        '/create-note/': (context) => const CreateNote(),
      },
    );
  }
}
