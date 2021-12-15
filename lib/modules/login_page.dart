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
          children: [
            Image.asset(
              'assets/tacaro.png',
              width: 200,
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
          ],
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
                borderSide: BorderSide(color: AppTheme.colors.border),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
