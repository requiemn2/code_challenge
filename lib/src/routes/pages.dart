import 'package:code_challenge/src/routes/routes.dart';
import 'package:code_challenge/src/ui/pages/home/home_page.dart';
import 'package:code_challenge/src/ui/pages/login/login_page.dart';
import 'package:flutter/cupertino.dart';

import '../ui/pages/history/history_page.dart';

abstract class Pages {
  static const String initial = Routes.login;
  static Map<String, Widget Function(BuildContext)> routes = {
    Routes.login: (_) => const LoginPage(),
    Routes.home: (_) => const HomePage(),
    Routes.history: (_) => const HistoryPage(),
  };
}
