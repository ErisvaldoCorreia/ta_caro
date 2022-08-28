import 'package:flutter/widgets.dart';

import '/shared/app_state.dart';

class CreateAccountController extends ChangeNotifier {
  AppState state = AppState.empty();

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

  void update(AppState state) {
    this.state = state;
    notifyListeners();
  }

  Future<void> createAccount() async {
    if (validate()) {
      try {
        update(AppState.loading());
        //CHAMA BACKEND
        await Future.delayed(Duration(seconds: 4));
        //
        update(AppState.success<String>('Usuario criado com sucesso'));
      } catch (e) {
        update(AppState.error('Falha ao cadastrar novo usuário'));
      }
    }
  }
}
