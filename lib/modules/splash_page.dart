import 'package:flutter/material.dart';

import '/shared/app_theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Funcao temp para navegacao e teste de load splash
    Future.delayed(Duration(seconds: 5))
        .then((value) => {Navigator.pushNamed(context, '/login')});

    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: Center(
        child: Image.asset('assets/tacaro.png'),
      ),
    );
  }
}
