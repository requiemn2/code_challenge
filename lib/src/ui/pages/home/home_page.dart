import 'package:code_challenge/src/ui/pages/home/widgets/custom_grid.dart';
import 'package:code_challenge/src/ui/pages/home/widgets/header.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        body: Column(
          children: [
            Header(size: size),
            SizedBox(height: size.height * 0.05),
            CustomGrid(size: size),
          ],
        ),
      ),
    );
  }
}
