import 'package:flutter/widgets.dart';

class LoginController {
  final formkey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  void onChanged({String? email, String? password}) {
    _email = email ?? _email;
    _password = password ?? _password;
  }

  bool validate() {
    final form = formkey.currentState!;
    if (form.validate()) {
      return true;
    }
    return false;
  }

  void login() {
    if (validate()) {
      print('Pode chamar o backend');
    }
  }
}
