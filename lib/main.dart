import 'package:code_challenge/src/routes/pages.dart';
import 'package:code_challenge/src/ui/global_controller.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GlobalController>(
      create: (_) => GlobalController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Code Challenge',
        initialRoute: Pages.initial,
        routes: Pages.routes,
      ),
    );
  }
}
