import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teste/components/my_button.dart';
import 'package:teste/components/my_text_field.dart';
import 'package:teste/components/squre_tile.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void verifyEmail(User user) {
    user.sendEmailVerification();
    Navigator.pop(context);
  }

  void authErrorDialog(String code) {
    String errorMsg = code;
    if (code == 'invalid-credential') {
      errorMsg = 'Credenciais inválidas';
    } else if (code == 'invalid-email') {
      errorMsg = 'Insira um endereço de email válido';
    } else if (code == 'channel-error') {
      errorMsg = 'Os campos não podem estar vazios';
    }
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Erro de autenticação'),
            content: Text(errorMsg),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          );
        });
  }

  void verifyEmailDialog(User user) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Verifique seu email'),
            content: const Text('Caso não tenha recebido um email, solicite um novo no botão abaixo'),
            actions: [  
              TextButton(
                onPressed: () => verifyEmail(user),
                child: const Text('Reenviar email'),
              ),
               TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Voltar'),
              ),
            ],
          );
        });
  }

  // signIn method
  void signIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      final user = FirebaseAuth.instance.currentUser!;
      if (!mounted) return;
      Navigator.pop(context);

      if (user.emailVerified) {
        Navigator.of(context).pushNamedAndRemoveUntil('/auth-page/', (_) => false );
      } else {
        verifyEmailDialog(user);
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      authErrorDialog(e.code);
    } catch (e) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('lib/images/fundo.png'), fit: BoxFit.cover),
      ),
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
                // logo e texto
                const Text(
                  'Bem-vindo!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),

                const Text(
                  'Insira suas credenciais para fazer login',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 50),

                // email texfield
                MyTextField(
                  controller: emailController,
                  hintText: "email",
                  obscureText: false,
                ),

                const SizedBox(height: 17),

                // password textfield
                MyTextField(
                    controller: passwordController,
                    hintText: "senha",
                    obscureText: true),

                const SizedBox(height: 17),

                // forgot password
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Esqueceu sua senha?',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // sign in button
                MyButton(
                  onTap: signIn,
                  text: 'Entrar',
                ),

                const SizedBox(height: 25),

                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Ou entre com',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // google + apple
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(
                      imagePath: 'lib/images/google.png',
                    ),
                    SizedBox(width: 25),
                    SquareTile(imagePath: 'lib/images/apple.png'),
                  ],
                ),

                const SizedBox(
                  height: 25,
                ),

                // não possui conta? Registre-se aqui
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Não possui conta?'),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/register/', (_) => false);
                      },
                      child: const Text(
                        'Registre-se aqui',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
