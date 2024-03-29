import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teste/views/home_page.dart';
import 'package:teste/views/login/login_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: ((context, snapshot) {
          if (!snapshot.hasData || !snapshot.data!.emailVerified) {
            return const LoginPage();
          }
          return const HomePage();
        })
      ),
    );
  }
}