import 'package:flutter/material.dart';

void genericErrorDialog(BuildContext context, String code) {
  String errorMsg = code;
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Erro!'),
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

void authErrorDialog(BuildContext context, String code) {
  String errorMsg = code;
  if (code == 'invalid-credential') {
    errorMsg = 'Credenciais inválidas';
  } else if (code == 'invalid-email') {
    errorMsg = 'Insira um endereço de email válido';
  } else if (code == 'channel-error') {
    errorMsg = 'Os campos não podem estar vazios';
  } else if (code == 'email-already-in-use') {
    errorMsg = 'Este email já foi cadastrado!';
  } else if (code == 'weak-password') {
    errorMsg = 'Sua senha é muito fraca';
  }
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Erro!'),
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
