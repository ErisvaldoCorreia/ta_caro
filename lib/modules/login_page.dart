import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

import '/shared/app_theme.dart';
import '/shared/button_type.dart';
import '/modules/login_controller.dart';
import '/components/button_widget.dart';
import '/components/input_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  void navigation(routeName) {
    Navigator.pushNamed(context, routeName);
  }

  @override
  void initState() {
    controller.addListener(() {
      controller.state.when(
        loading: () => print('Loading....'),
        // error: (message, _) =>
        //     scaffoldKey.currentState!.showBottomSheet((context) => BottomSheet(
        //         onClosing: () {},
        //         builder: (context) => Container(
        //               child: Padding(
        //                 padding: EdgeInsets.all(40),
        //                 child: Text(message),
        //               ),
        //             ))),
        error: (message, _) => showModalBottomSheet(
            context: context,
            builder: (context) => Container(
                  child: Padding(
                    padding: EdgeInsets.all(40),
                    child: Text(message),
                  ),
                )),
        success: (value) => navigation('/home'),
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
      key: scaffoldKey,
      backgroundColor: AppTheme.colors.background,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        //Validar centralização de tela com singlechild
        child: SingleChildScrollView(
          //padding: EdgeInsets.only(top: 40),
          child: Form(
            key: controller.formkey,
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
                  onChanged: (value) => controller.onChanged(email: value),
                  validator: (value) =>
                      isEmail(value) ? null : 'Digite um e-mail válido',
                ),
                SizedBox(height: size.height * .02),
                InputText(
                    label: "Senha",
                    hint: "Digite sua senha",
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
                      label: 'Entrar',
                      onPress: () {
                        controller.login();
                      },
                    ),
                  ),
                ),
                SizedBox(height: size.height * .03),
                Button(
                  label: 'Criar Conta',
                  type: ButtonType.outline,
                  onPress: () {
                    navigation('/login/create-account');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
