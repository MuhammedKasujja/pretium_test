import 'package:flutter/material.dart';
import 'package:pretium_test/constants.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.iconData,
    this.color,
    this.width,
    this.isLoading = false,
  });

  final Color? color;
  final IconData? iconData;
  final String? label;
  final Function()? onPressed;
  final double? width;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final text = Text(label!, overflow: TextOverflow.ellipsis);
    final button = FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        elevation: 2,
      ),
      onPressed: isLoading ? () {} : onPressed,
      child:
          isLoading
              ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.5,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  text,
                ],
              )
              : text,
    );

    return SizedBox(width: width ?? double.infinity, height: 50, child: button);
  }
}