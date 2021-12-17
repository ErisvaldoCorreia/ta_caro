import 'package:flutter/material.dart';

import '/components/button_widget.dart';
import '/components/input_widget.dart';
import '/shared/app_theme.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Crie sua conta!').title,
            SizedBox(height: size.height * .01),
            Text('Mantenha suas contas em dia').subtitle,
            SizedBox(height: size.height * .05),
            InputText(
              label: "Nome",
              hint: "Digite seu nome completo",
            ),
            SizedBox(height: size.height * .02),
            InputText(
              label: "E-mail",
              hint: "Digite seu E-mail",
            ),
            SizedBox(height: size.height * .02),
            InputText(
              label: "Senha",
              hint: "Digite sua senha",
            ),
            SizedBox(height: size.height * .07),
            Button(
              label: 'Criar Conta',
            ),
            SizedBox(height: size.height * .03),
          ],
        ),
      ),
    );
  }
}
