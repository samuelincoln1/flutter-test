import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teste/components/my_button.dart';
import 'package:teste/components/my_text_field.dart';
import 'package:teste/components/squre_tile.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nomeController = TextEditingController();

  void authErrorDialog(String code) {
    String errorMsg = code;
    if (code == 'email-already-in-use') {
      errorMsg = 'Este email já foi cadastrado!';
    } else if (code == 'invalid-email') {
      errorMsg = 'Insira um endereço de email válido';
    } else if (code == 'weak-password') {
      errorMsg = 'Sua senha é muito fraca';
    } else if (code == 'channel-error') {
      errorMsg = 'Os campos não podem estar vazios';
    }
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: AlertDialog(
              title: const Text('Erro no cadastro'),
              content: Text(errorMsg),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                )
              ],
            ),
          );
        }
      );
  }

  // signIn method
  void signUp() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      final user = FirebaseAuth.instance.currentUser!;
      user.updateDisplayName(nomeController.text);
      user.sendEmailVerification();
      print('------- enviei email -------');
      if (!mounted) return;
    

      showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: AlertDialog(
              title: const Text('Verifique sua conta'),
              content: const Text('Enviamos um email para você verificar sua conta!'),
              actions: [
                TextButton(
                  onPressed: () {
                      print('------- trocando pag -------');
                      Navigator.of(context).pushNamed('/auth-page/');
                  },
                  child: const Text('OK'),
                )
              ],
            ),
          );
        }
      );

     
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
                  'Crie sua conta!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),

                const Text(
                  'Insira as informações abaixo',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 20),

                MyTextField(
                    controller: nomeController,
                    hintText: "nome completo",
                    obscureText: false),
                const SizedBox(height: 17),
                // username texfield
                MyTextField(
                    controller: emailController,
                    hintText: "email",
                    obscureText: false),

                const SizedBox(height: 17),

                // password textfield
                MyTextField(
                    controller: passwordController,
                    hintText: "senha",
                    obscureText: true),

                const SizedBox(height: 42),

                // register button
                MyButton(
                  onTap: signUp,
                  text: 'Criar conta',
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
                    const Text('Já possui uma conta?'),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil('/login/', (_) => false);
                      },
                      child: const Text(
                        'Fazer login',
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
