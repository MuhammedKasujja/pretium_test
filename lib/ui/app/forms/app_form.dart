import 'package:flutter/material.dart';
import 'package:pretium_test/ui/app/scrollable_listview.dart';

class AppForm extends StatelessWidget {
  const AppForm({
    super.key,
    this.children,
    this.child,
    required this.formKey,
    required this.focusNode,
    this.padding,
  });

  final GlobalKey<FormState> formKey;
  final List<Widget>? children;
  final Widget? child;
  final FocusScopeNode? focusNode;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    late final Widget formChild;
    if (child != null) {
      formChild = SingleChildScrollView(child: child);
    } else {
      formChild = ScrollableListView(
        primary: true,
        padding: padding,
        children: children,
      );
    }
    return FocusScope(
      node: focusNode,
      child: Form(key: formKey, child: formChild),
    );
  }
}
