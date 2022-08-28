import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

import 'create_account_controller.dart';
import '/components/components.dart';
import '/shared/app_theme.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final controller = CreateAccountController();

  @override
  void initState() {
    controller.addListener(() {
      controller.state.when(
        loading: () => print('Loading....'),
        error: (message, _) => print(message),
        success: (value) => print(value),
        orElse: () {},
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 40),
          child: Form(
            key: controller.formkey,
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
                  validator: (value) =>
                      value.isNotEmpty ? null : 'Informe o nome completo',
                  onChanged: (value) => controller.onChanged(name: value),
                ),
                SizedBox(height: size.height * .02),
                InputText(
                  label: "E-mail",
                  hint: "Digite seu E-mail",
                  onChanged: (value) => controller.onChanged(email: value),
                  validator: (value) =>
                      isEmail(value) ? null : 'Digite um e-mail válido',
                ),
                SizedBox(height: size.height * .02),
                InputText(
                    label: "Senha",
                    hint: "Crie sua senha",
                    obscure: true,
                    onChanged: (value) => controller.onChanged(password: value),
                    validator: (value) => value.length >= 6
                        ? null
                        : 'Senha deve ter no minimo 6 digitos'),
                SizedBox(height: size.height * .07),
                AnimatedBuilder(
                  animation: controller,
                  builder: (_, __) => controller.state.when(
                    loading: () => CircularProgressIndicator(),
                    orElse: () => Button(
                      //Refatorar botão para loading no componente
                      label: 'Cadastrar',
                      onPress: () {
                        controller.createAccount();
                      },
                    ),
                  ),
                ),
                SizedBox(height: size.height * .03),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
