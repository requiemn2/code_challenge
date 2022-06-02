import 'package:code_challenge/src/ui/global_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    final globalController = context.read<GlobalController>();
    return Container(
      padding:
          EdgeInsets.only(left: size.width * 0.05, right: size.width * 0.2),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.05,
          ),
          Text(
            'Welcome ${globalController.user.name}',
            style: TextStyle(
              color: Colors.white,
              fontSize: size.height * 0.07,
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Text(
            'Frontier supports multiple blockchains and is always adding support for more.',
            style: TextStyle(
              color: Colors.white24,
              fontSize: size.height * 0.02,
            ),
          ),
        ],
      ),
    );
  }
}
