import 'package:flutter/material.dart';
import 'package:pretium_test/ui/app/forms/decorated_form_field.dart';
import 'package:pretium_test/utils/translations.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    super.key,
    this.controller,
    this.newPassword = true,
    this.validate = true,
    this.onSavePressed,
    this.labelText,
    this.onSaveForm,
    this.prefixIcon = const Icon(Icons.lock_outline),
  });

  final TextEditingController? controller;
  final Function(BuildContext)? onSavePressed;
  final bool newPassword;
  final bool validate;
  final String? labelText;
  final ValueChanged<String?>? onSaveForm;
  final Icon? prefixIcon;

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _isPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    return DecoratedFormField(
      key: ValueKey(widget.labelText ?? LocaleKeys.password.tr()),
      controller: widget.controller,
      onSavePressed: widget.onSavePressed,
      onSaveForm: widget.onSaveForm,
      autocorrect: false,
      decoration: InputDecoration(
        labelText: widget.labelText,
        prefixIcon: widget.prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: .8, color: Colors.grey.shade600),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.error,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: LocaleKeys.passwordHint.tr(),
        hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
        // labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
        suffixIcon: IconButton(
          alignment: Alignment.bottomCenter,
          icon: Icon(
            _isPasswordObscured
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
          ),
          onPressed: () {
            setState(() {
              _isPasswordObscured = !_isPasswordObscured;
            });
          },
        ),
      ),
      validator: (value) {
        if (!widget.validate) {
          return null;
        }

        if (value.isEmpty || value.trim().isEmpty) {
          return widget.newPassword ? null : LocaleKeys.passwordHint.tr();
        }

        return null;
      },
      obscureText: _isPasswordObscured,
      keyboardType: TextInputType.visiblePassword,
      autofillHints:
          widget.validate
              ? [
                widget.newPassword
                    ? AutofillHints.newPassword
                    : AutofillHints.password,
              ]
              : null,
    );
  }
}
