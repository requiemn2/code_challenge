import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class ProgressDialog {
  static Future<void> show(BuildContext context) {
    return showCupertinoModalPopup(
      context: context,
      builder: (_) => WillPopScope(
        onWillPop: () async => false,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          color: Colors.white30,
          child: const CupertinoActivityIndicator(
            radius: 20,
          ),
        ),
      ),
    );
  }
}
