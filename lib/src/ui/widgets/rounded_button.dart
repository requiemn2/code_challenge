import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final Color textColor, buttonColor, borderColor;
  final EdgeInsets padding;
  final double? fontSize;

  const RoundedButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.textColor = Colors.white,
    this.buttonColor = Colors.green,
    this.borderColor = Colors.green,
    this.padding = const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            width: 1.4,
            color: borderColor,
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      onPressed: onPressed,
      minSize: 30,
      padding: EdgeInsets.zero,
    );
  }
}
