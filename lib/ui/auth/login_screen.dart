import 'package:flutter/material.dart';
import 'package:pretium_test/ui/app/buttons/elevated_button.dart';
import 'package:pretium_test/ui/app/forms/app_form.dart';
import 'package:pretium_test/ui/app/forms/decorated_form_field.dart';
import 'package:pretium_test/ui/app/forms/password_field.dart';
import 'package:pretium_test/utils/translations.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  static final _formKey = GlobalKey<FormState>(debugLabel: '_login');
  final FocusScopeNode _focusNode = FocusScopeNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AppForm(
          padding: const EdgeInsets.all(20),
          formKey: _formKey,
          focusNode: _focusNode,
          children: [
            DecoratedFormField(
              prefixIcon: const Icon(Icons.email),
              label: LocaleKeys.email.tr(),
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
            ),
            PasswordFormField(
              labelText: LocaleKeys.password.tr(),
              controller: _passwordController,
            ),
            AppButton(
              label: LocaleKeys.login.tr(),
              onPressed: () {
                if (_formKey.currentState!.validate()) {}
              },
            ),
          ],
        ),
      ),
    );
  }
}
