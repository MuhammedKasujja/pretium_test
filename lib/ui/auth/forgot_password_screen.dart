import 'package:flutter/material.dart';
import 'package:pretium_test/core/radius.dart';
import 'package:pretium_test/ui/app/buttons/elevated_button.dart';
import 'package:pretium_test/ui/app/forms/app_form.dart';
import 'package:pretium_test/ui/app/forms/email_field.dart';
import 'package:pretium_test/utils/translations.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  static final _formKey = GlobalKey<FormState>(debugLabel: '_forgotPassword');
  final FocusScopeNode _focusNode = FocusScopeNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AppForm(
        formKey: _formKey,
        focusNode: _focusNode,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            spacing: DesignSystemRadius.lg,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.forgotPassword.tr(),
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                LocaleKeys.recoverPasswordHint.tr(),
                style: TextStyle(color: Colors.grey.shade600),
              ),
              EmailFormField(controller: _emailController),
              AppButton(
                label: LocaleKeys.sendResetCode.tr(),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
