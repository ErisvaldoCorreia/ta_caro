import 'package:flutter/widgets.dart';

class CreateAccountController {
  final formkey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';
  String _name = '';

  void onChanged({String? email, String? password, String? name}) {
    _email = email ?? _email;
    _password = password ?? _password;
    _name = name ?? _name;
  }

  bool validate() {
    final form = formkey.currentState!;
    if (form.validate()) {
      return true;
    }
    return false;
  }

  void createAccount() {
    if (validate()) {
      print('Pode chamar o backend');
    }
  }
}
