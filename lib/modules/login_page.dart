import 'package:flutter/material.dart';

import '/shared/app_theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          // Alinhamento central na coluna
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

enum ButtonType { fill, outline, none }

class Button extends StatelessWidget {
  final String label;
  final ButtonType type;

  const Button({
    Key? key,
    required this.label,
    this.type = ButtonType.fill,
  }) : super(key: key);

  TextStyle get textStyle {
    switch (type) {
      case ButtonType.fill:
        return AppTheme.textStyles.buttonBackgroundColor;
      case ButtonType.outline:
        return AppTheme.textStyles.buttonBoldTextColor;
      case ButtonType.none:
        return AppTheme.textStyles.buttonTextColor;
      default:
        throw 'Button Type Invalid';
    }
  }

  BoxDecoration get boxDecoration {
    switch (type) {
      case ButtonType.fill:
        return BoxDecoration(
          color: AppTheme.colors.primary,
          borderRadius: BorderRadius.circular(10),
        );
      case ButtonType.outline:
        return BoxDecoration(
          color: AppTheme.colors.background,
          border: Border.fromBorderSide(
            BorderSide(
              color: AppTheme.colors.border,
              width: 3,
            ),
          ),
          borderRadius: BorderRadius.circular(10),
        );
      case ButtonType.none:
        return BoxDecoration(
          color: Colors.transparent,
        );
      default:
        throw 'Button Type Invalid';
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        print('clicou no botao');
      },
      child: Container(
        height: size.height * .058,
        width: double.maxFinite,
        decoration: boxDecoration,
        child: Center(
          child: Text(
            label,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}

class InputText extends StatelessWidget {
  final String label;
  final String hint;
  const InputText({
    required this.label,
    required this.hint,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label).label,
          SizedBox(
            height: size.height * .012,
          ),
          TextFormField(
            style: AppTheme.textStyles.input,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 16.0),
              hintText: hint,
              hintStyle: AppTheme.textStyles.hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppTheme.colors.primary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
