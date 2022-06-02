import 'package:code_challenge/src/ui/pages/login/login_controller.dart';
import 'package:code_challenge/src/ui/pages/login/widgets/login_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    final padding = mediaQuery.padding;

    return ChangeNotifierProvider<LoginController>(
      create: (_) => LoginController(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                height: size.height - padding.bottom - padding.top,
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    const Text(
                      'Enter your information',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const LoginForm(),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Text(
                          'Do not have an account?',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        CupertinoButton(
                          child: const Text('Register'),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
