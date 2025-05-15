import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).focusColor,
      ),
      child: Icon(
        Icons.account_balance_wallet,
        color: theme.colorScheme.primary,
        size: 30,
      ),
    );
  }
}
