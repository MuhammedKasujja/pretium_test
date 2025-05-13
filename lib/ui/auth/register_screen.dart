import 'package:flutter/material.dart';
import 'package:pretium_test/ui/app/buttons/elevated_button.dart';
import 'package:pretium_test/ui/app/forms/app_form.dart';
import 'package:pretium_test/ui/app/forms/decorated_form_field.dart';
import 'package:pretium_test/ui/app/forms/password_field.dart';
import 'package:pretium_test/utils/translations.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static final _formKey = GlobalKey<FormState>(debugLabel: '_register');

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusScopeNode _focusNode = FocusScopeNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppForm(
        formKey: RegisterScreen._formKey,
        focusNode: _focusNode,
        children: [
          DecoratedFormField(
            prefixIcon: const Icon(Icons.person),
            keyboardType: TextInputType.text,
            controller: _firstNameController,
            label: LocaleKeys.firstName.tr(),
          ),
          DecoratedFormField(
            prefixIcon: const Icon(Icons.person),
            keyboardType: TextInputType.text,
            controller: _lastNameController,
            label: LocaleKeys.lastName.tr(),
          ),
          DecoratedFormField(
            prefixIcon: const Icon(Icons.email),
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
            label: LocaleKeys.email.tr(),
          ),
          PasswordFormField(
            controller: _passwordController,
            labelText: LocaleKeys.password.tr(),
          ),
          AppButton(
            label: LocaleKeys.register.tr(),
            onPressed: () {
              if (RegisterScreen._formKey.currentState!.validate()) {}
            },
          ),
        ],
      ),
    );
  }
}
