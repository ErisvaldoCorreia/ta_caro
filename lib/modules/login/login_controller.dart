import 'package:flutter/widgets.dart';

import '/shared/app_state.dart';

class LoginController extends ChangeNotifier {
  AppState state = AppState.empty();

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

  void update(AppState state) {
    this.state = state;
    notifyListeners();
  }

  Future<void> login() async {
    if (validate()) {
      try {
        update(AppState.loading());
        //CHAMA BACKEND
        await Future.delayed(Duration(seconds: 4));
        update(AppState.error('Falha no login'));
        //Devolve estado logado
        //update(AppState.success<String>('Usuario Logado'));
      } catch (e) {
        update(AppState.error('Falha no login'));
      }
    }
  }
}
