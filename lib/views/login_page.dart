import 'package:flutter/material.dart';
import 'package:teste/components/my_button.dart';
import 'package:teste/components/my_text_field.dart';
import 'package:teste/components/squre_tile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
   
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // signIn method
  void signIn() {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/images/fundo.png'),
            fit: BoxFit.cover
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    const SizedBox(height:50),
                    
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
                    
                    const SizedBox(height:50),        
                       
                    // username texfield
                    MyTextField(controller: emailController, hintText: "email", obscureText: false),
                      
                    const SizedBox(height:17),  
                      
                    // password textfield
                    MyTextField(controller: passwordController, hintText: "senha", obscureText: true), 
                      
                    const SizedBox(height:17), 
                    
                    // forgot password
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Esqueceu sua senha?',
                           style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                      
                    const SizedBox(height:25), 
                   
                    // sign in button
                    MyButton( 
                      onTap: signIn,
                      text: 'Entrar',
                    ),
                      
                    const SizedBox(height:25), 
                      
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
                      
                    const SizedBox(height:20),
                      
                    // google + apple
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SquareTile(
                          imagePath: 'lib/images/google.png',),
                        SizedBox(width: 25),
                        SquareTile(imagePath: 'lib/images/apple.png'),
                      ],
                    ),
                    
                    const SizedBox(height: 25,),
                      
                    // não possui conta? Registre-se aqui
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Não possui conta?'),
                        const SizedBox(width: 4,),
                        GestureDetector(
                          onTap: ()  {
                          Navigator.of(context).pushNamedAndRemoveUntil('/register/', (_) => false);
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
      )
    );
  }
}