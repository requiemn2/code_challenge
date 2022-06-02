import 'package:code_challenge/src/data/services/remote/authentication_service.dart';
import 'package:flutter/widgets.dart';

import '../../../data/models/user.dart';

class LoginController extends ChangeNotifier {
  String _email = '', _rfc = '';

  void onEmailChanged(String email) {
    _email = email;
  }

  void onRfcChanged(String rfc) {
    _rfc = rfc;
  }

  Future<User?> submit() {
    final _authenticationService = AuthenticationService();
    return _authenticationService.login(_rfc, _email);
  }
}
