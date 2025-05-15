import 'package:flutter/material.dart';
import 'package:pretium_test/utils/extensions.dart';
import 'package:pretium_test/utils/translations.dart';

import 'decorated_form_field.dart';

class EmailFormField extends StatelessWidget {
  const EmailFormField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return DecoratedFormField(
      prefixIcon: const Icon(Icons.email_outlined),
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      label: LocaleKeys.email.tr(),
      hint: LocaleKeys.emailHint.tr(),
      validator:
          (val) =>
              val.isEmpty || val.trim().isEmpty
                  ? LocaleKeys.pleaseEnterYourEmail.tr()
                  : !val.isValidEmail
                  ? LocaleKeys.pleaseEnterValidEmail.tr()
                  : null,
    );
  }
}
