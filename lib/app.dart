import 'package:flutter/material.dart';

import '/modules/login_page.dart';
import '/modules/splash_page.dart';
import '/modules/create_account_page.dart';
import '/modules/home_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TaCaroApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashPage(),
        '/login': (context) => LoginPage(),
        '/login/create-account': (context) => CreateAccountPage(),
        '/home': (context) => HomePage()
      },
    );
  }
}
