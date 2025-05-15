import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:pretium_test/core/radius.dart';
import 'package:pretium_test/ui/app/buttons/elevated_button.dart';
import 'package:pretium_test/ui/app/forms/app_form.dart';
import 'package:pretium_test/ui/app/forms/decorated_form_field.dart';
import 'package:pretium_test/ui/app/forms/email_field.dart';
import 'package:pretium_test/ui/app/forms/password_field.dart';
import 'package:pretium_test/utils/toast.dart';
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

  bool hasAcceptedTerms = false;

  Future<void> _launchUrl() async {
    showToast(
      context: context,
      message: LocaleKeys.openTermsAndConditions.tr(),
    );
    if (!await launchUrl(Uri.parse('https://pretium.africa/term-of-use'))) {
      debugPrint('Could not launch terms and conditions page');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AppForm(
        formKey: RegisterScreen._formKey,
        focusNode: _focusNode,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            spacing: DesignSystemRadius.lg,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.createAccount.tr(),
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                LocaleKeys.createAccountHint.tr(),
                style: TextStyle(color: Colors.grey.shade600),
              ),
              SizedBox(height: DesignSystemRadius.xs),
              DecoratedFormField(
                prefixIcon: const Icon(Icons.person_outline),
                keyboardType: TextInputType.text,
                controller: _firstNameController,
                label: LocaleKeys.firstName.tr(),
                validator:
                    (val) =>
                        val.isEmpty || val.trim().isEmpty
                            ? LocaleKeys.pleaseEnterYourFirstname.tr()
                            : null,
              ),
              DecoratedFormField(
                prefixIcon: const Icon(Icons.person_outline),
                keyboardType: TextInputType.text,
                controller: _lastNameController,
                label: LocaleKeys.lastName.tr(),
                validator:
                    (val) =>
                        val.isEmpty || val.trim().isEmpty
                            ? LocaleKeys.pleaseEnterYourLastname.tr()
                            : null,
              ),
              EmailFormField(controller: _emailController),
              PasswordFormField(
                controller: _passwordController,
                labelText: LocaleKeys.password.tr(),
                validate: true,
                newPassword: false,
              ),
              Row(
                children: [
                  Checkbox(
                    value: hasAcceptedTerms,
                    onChanged: (value) {
                      setState(() {
                        hasAcceptedTerms = value!;
                      });
                    },
                  ),
                  InkWell(
                    onTap: _launchUrl,
                    child: Text(
                      LocaleKeys.acceptTermsAndConditions.tr(),
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
              AppButton(
                label: LocaleKeys.register.tr(),
                onPressed: () {
                  if (RegisterScreen._formKey.currentState!.validate()) {
                    if (!hasAcceptedTerms) {
                      showToast(
                        context: context,
                        isError: true,
                        message: LocaleKeys.pleaseAcceptTerms.tr(),
                      );
                    }
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.alreadyHaveAccount.tr(),
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(LocaleKeys.login.tr()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
