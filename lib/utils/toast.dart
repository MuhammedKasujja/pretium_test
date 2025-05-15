import 'package:flutter/material.dart';

void showToast({
  required BuildContext context,
  required String message,
  bool isError = false,
}) {
  final colorScheme = Theme.of(context).colorScheme;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: isError ? colorScheme.error : colorScheme.primary,
      behavior: SnackBarBehavior.floating,
      content: Text(message),
      margin: EdgeInsets.all(10),
    ),
  );
}
