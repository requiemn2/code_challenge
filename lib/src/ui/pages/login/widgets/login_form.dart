import 'package:code_challenge/src/ui/global_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../../data/models/user.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/progress_dialog.dart';
import '../../../widgets/input_text.dart';
import '../../../widgets/rounded_button.dart';
import '../login_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  void _submit(BuildContext context) async {
    final controller = context.read<LoginController>();
    final globalController = context.read<GlobalController>();
    ProgressDialog.show(context);
    final User? user = await controller.submit();
    Navigator.pop(context);
    if (user == null) {
      showDialog(
        context: context,
        builder: (_) => const AlertDialog(
          title: Text('ERROR'),
          content: Text('Email o RFC incorrecto'),
        ),
      );
    } else {
      globalController.user = user;

      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.home,
        (_) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<LoginController>(context, listen: false);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 340),
      child: Column(
        children: [
          InputText(
            labelText: 'Email',
            prefixIcon: const Icon(Icons.email_outlined),
            validator: (text) {
              if (RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(text)) {
                return null;
              } else {
                return 'Email inválido';
              }
            },
            onChanged: controller.onEmailChanged,
            textInputAction: TextInputAction.next,
            keyboardtType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 20,
          ),
          InputText(
            labelText: 'RFC',
            isRfc: true,
            prefixIcon: const Icon(Icons.portrait_outlined),
            onChanged: controller.onRfcChanged,
            onSubmitted: (text) => _submit(context),
            textInputAction: TextInputAction.send,
            validator: (text) {
              if (RegExp(
                      r'^([A-ZÑ&]{3,4})(?:- )?(\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01]))(?:- )?([A-Z\d]{2})([A\d])$')
                  .hasMatch(text)) {
                return null;
              } else {
                return 'RFC inválido';
              }
            },
          ),
          Align(
            alignment: Alignment.centerRight,
            child: CupertinoButton(
              child: const Text(
                'Forgot your password?',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              onPressed: () {},
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          RoundedButton(
            label: 'Login',
            onPressed: () => _submit(context),
            padding: const EdgeInsets.symmetric(
              vertical: 9,
              horizontal: 50,
            ),
          ),
        ],
      ),
    );
  }
}
