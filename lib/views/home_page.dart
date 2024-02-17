import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/images/fundo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text('Anotações',
                          style: GoogleFonts.lobster(fontSize: 38)),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: signOut,
                      icon: const Icon(Icons.logout),
                    ),
                  ],
                ),
                Container(
                  width: 300, 
                  height: 50, 
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),  color: Colors.red.shade300, ),
                  child: const Center(child: Text('oi', style:TextStyle(color:Colors.white, fontSize: 23,),),),
                ),
                Text('Logado como ${user.email}'),
                Text('Username: ${user.displayName}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
