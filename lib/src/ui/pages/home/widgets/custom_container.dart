import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    Key? key,
    required this.size,
    required this.color,
    required this.icon,
    required this.description,
    this.onTap,
  }) : super(key: key);

  final Color color;
  final Icon icon;
  final Text description;
  final Size size;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(size.height * 0.01),
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        height: size.height * 0.27,
        width: size.width * 0.35,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            icon,
            description,
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
