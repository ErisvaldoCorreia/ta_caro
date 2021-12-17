import 'package:flutter/material.dart';

import '/shared/button_type.dart';
import '/components/button_widget.dart';
import '/components/input_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/tacaro.png',
              width: size.width * .5,
            ),
            InputText(
              label: "E-mail",
              hint: "Digite seu E-mail",
            ),
            SizedBox(
              height: size.height * .02,
            ),
            InputText(
              label: "Senha",
              hint: "Digite sua senha",
            ),
            SizedBox(
              height: size.height * .07,
            ),
            Button(
              label: 'Entrar',
            ),
            SizedBox(
              height: size.height * .03,
            ),
            Button(
              label: 'Criar Conta',
              type: ButtonType.outline,
            ),
          ],
        ),
      ),
    );
  }
}
