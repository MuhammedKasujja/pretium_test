import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DecoratedFormField extends StatelessWidget {
  const DecoratedFormField({
    super.key,
    required this.keyboardType,
    this.controller,
    this.label,
    this.onSavePressed,
    this.autocorrect = false,
    this.obscureText = false,
    this.onChanged,
    this.validator,
    this.minLines,
    this.maxLines,
    this.onFieldSubmitted,
    this.initialValue,
    this.enabled = true,
    this.hint,
    this.suffixIcon,
    this.expands = false,
    this.autofocus = false,
    this.autofillHints,
    this.textAlign = TextAlign.start,
    this.decoration,
    this.focusNode,
    this.showClear = true,
    this.inputFormatters,
    this.onSaveForm,
    this.prefixIcon,
  });

  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final String? initialValue;
  final Function(String)? validator;
  final TextInputType keyboardType;
  final int? maxLines;
  final int? minLines;
  final bool? enabled;
  final bool autocorrect;
  final bool obscureText;
  final bool expands;
  final bool autofocus;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String?>? onSaveForm;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final Iterable<String>? autofillHints;
  final Function(BuildContext)? onSavePressed;
  final TextAlign textAlign;
  final InputDecoration? decoration;
  final FocusNode? focusNode;
  final bool showClear;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    InputDecoration? inputDecoration =
        decoration ??
        InputDecoration(
          labelText: label ?? '',
          hintText: hint ?? '',
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(),
          floatingLabelBehavior:
              (hint ?? '').isNotEmpty && (label ?? '').isEmpty
                  ? FloatingLabelBehavior.always
                  : FloatingLabelBehavior.auto,
        );

    return TextFormField(
      key: ValueKey(label),
      focusNode: focusNode,
      controller: controller,
      autofocus: autofocus,
      decoration: inputDecoration,
      validator:
          (val) => val == null || validator == null ? null : validator!(val),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardType,
      maxLines: expands ? null : maxLines ?? 1,
      minLines: expands ? null : minLines,
      expands: expands,
      autocorrect: autocorrect,
      obscureText: obscureText,
      initialValue: initialValue,
      textInputAction:
          keyboardType == TextInputType.multiline
              ? TextInputAction.newline
              : null,
      onChanged: (value) {
        if (onChanged != null) {
          onChanged!(value);
        }
      },
      inputFormatters: inputFormatters,
      onFieldSubmitted: (value) {
        if (onFieldSubmitted != null) {
          return onFieldSubmitted!(value);
        } else if (keyboardType == TextInputType.multiline) {
          return;
        }
      },
      enabled: enabled,
      autofillHints: autofillHints,
      textAlign: textAlign,
      // handle form save validator
      onSaved: onSaveForm,
    );
  }
}
