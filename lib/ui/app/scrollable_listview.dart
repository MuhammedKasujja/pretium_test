import 'package:flutter/material.dart';

class ScrollableListView extends StatefulWidget {
  const ScrollableListView({
    super.key,
    required this.children,
    this.scrollController,
    this.padding,
    this.primary,
    this.showScrollbar = false,
  });

  final List<Widget>? children;
  final ScrollController? scrollController;
  final EdgeInsetsGeometry? padding;
  final bool? primary;
  final bool showScrollbar;

  @override
  State<ScrollableListView> createState() => _ScrollableListViewState();
}

class _ScrollableListViewState extends State<ScrollableListView> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller =
        widget.primary == true
            ? null
            : widget.scrollController ?? _scrollController;
    Widget child = ListView(
      padding: widget.padding,
      controller: controller,
      shrinkWrap: true,
      primary: widget.primary,
      children: widget.children!,
    );

    if (widget.showScrollbar) {
      child = Scrollbar(
        controller: controller,
        thumbVisibility: true,
        child: child,
      );
    }

    return child;
  }
}
