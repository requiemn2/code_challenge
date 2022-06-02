import 'package:code_challenge/src/routes/routes.dart';
import 'package:code_challenge/src/ui/pages/home/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class CustomGrid extends StatelessWidget {
  const CustomGrid({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        CustomContainer(
          size: size,
          color: Colors.grey.shade800,
          icon: const Icon(Icons.add_card, color: Colors.white),
          description: const Text(
            'Create crypto wallet',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        CustomContainer(
          size: size,
          color: Colors.green,
          icon: const Icon(Icons.download_outlined),
          description: const Text('Import wallet'),
        ),
        CustomContainer(
          size: size,
          color: Colors.orange,
          icon: const Icon(Icons.history),
          description: const Text('Check your history'),
          onTap: () {
            Navigator.pushNamed(context, Routes.history);
          },
        ),
        MyWidget(
          size: size,
        ),
      ],
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      size: size,
      color: Colors.blue.shade300,
      icon: const Icon(Icons.exit_to_app),
      description: const Text('Log out'),
      onTap: () => showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Log out'),
          content: const Text('Are you sure you want to log out?'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, Routes.login),
              child: const Text('Yes'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('No'),
            )
          ],
        ),
      ),
    );
  }
}

// _showConfirmationDialog(context) {
//   return showDialog(
//     context: context,
//     builder: (_) {
//       return AlertDialog(
//         title: const Text('Log out'),
//         content: const Text('Are you sure you want to log out?'),
//         actions: <Widget>[
//           ElevatedButton(
//             onPressed: () =>
//                 Navigator.pushReplacementNamed(context, Routes.login),
//             child: const Text('Yes'),
//           ),
//           ElevatedButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('No'),
//           )
//         ],
//       );
//     },
//   );
// }
