import 'package:flutter/material.dart';

class AppDialog {
  void showLoading(BuildContext context, {String message = 'กำลังโหลดข้อมูล'}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 16.0),
              Text(message),
            ],
          ),
        );
      },
    );
  }

  void hideDialog(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
