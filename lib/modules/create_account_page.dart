import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

import '/components/button_widget.dart';
import '/components/input_widget.dart';
import '/shared/app_theme.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.colors.background,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: BackButton(
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: AppTheme.colors.background,
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
              validator: (value) =>
                  isEmail(value) ? null : 'Digite um e-mail válido',
            ),
            SizedBox(height: size.height * .02),
            InputText(
              label: "Senha",
              hint: "Crie sua senha",
              obscure: true,
            ),
            SizedBox(height: size.height * .07),
            Button(
              label: 'Criar Conta',
              onPress: () {},
            ),
            SizedBox(height: size.height * .03),
          ],
        ),
      ),
    );
  }
}
