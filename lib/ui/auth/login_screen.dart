import 'package:flutter/material.dart';
import 'package:pretium_test/core/radius.dart';
import 'package:pretium_test/router.dart';
import 'package:pretium_test/ui/app/app_logo.dart';
import 'package:pretium_test/ui/app/buttons/elevated_button.dart';
import 'package:pretium_test/ui/app/forms/app_form.dart';
import 'package:pretium_test/ui/app/forms/email_field.dart';
import 'package:pretium_test/ui/app/forms/password_field.dart';
import 'package:pretium_test/utils/translations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static final _formKey = GlobalKey<FormState>(debugLabel: '_login');

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final FocusScopeNode _focusNode = FocusScopeNode();

  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AppForm(
          formKey: LoginScreen._formKey,
          focusNode: _focusNode,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              spacing: DesignSystemRadius.xl,
              children: [
                SizedBox(),
                AppLogo(),
                Column(
                  spacing: DesignSystemRadius.lg,
                  children: [
                    Text(
                      LocaleKeys.welcomeMessage.tr(),
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),

                    Text(
                      LocaleKeys.signInContinue.tr(),
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ],
                ),
                SizedBox(height: DesignSystemRadius.xs),
                EmailFormField(controller: _emailController),
                PasswordFormField(
                  labelText: LocaleKeys.password.tr(),
                  controller: _passwordController,
                  validate: true,
                  newPassword: false,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: _rememberMe,
                          onChanged: (value) {
                            setState(() {
                              _rememberMe = value!;
                            });
                          },
                        ),
                        InkWell(
                          child: Text(LocaleKeys.rememberMe.tr()),
                          onTap:
                              () => setState(() {
                                _rememberMe = !_rememberMe;
                              }),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).pushNamed(AppRouter.forgotPassword);
                      },
                      child: Text(
                        LocaleKeys.forgotPassword.tr(),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                AppButton(
                  label: LocaleKeys.login.tr(),
                  onPressed: () {
                    if (LoginScreen._formKey.currentState!.validate()) {}
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LocaleKeys.dontHaveAccount.tr(),
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    TextButton(
                      onPressed:
                          () =>
                              Navigator.pushNamed(context, AppRouter.register),
                      child: Text(LocaleKeys.signUp.tr()),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
