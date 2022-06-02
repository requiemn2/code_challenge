import 'package:flutter/cupertino.dart';

import '../data/models/user.dart';

class GlobalController extends ChangeNotifier {
  User _user = User(
    rfc: '',
    email: '',
    name: '',
    lastName: '',
  );

  set user(User user) {
    _user = user;
    notifyListeners();
  }

  User get user {
    return _user;
  }
}
