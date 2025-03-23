import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {super.key,
      this.belowButton,
      required this.icon,
      this.iconSize,
      this.sizeOfButton,
      required this.onPressed});
  final Widget? belowButton;
  final Widget icon;
  final double? iconSize;
  final Size? sizeOfButton;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          iconSize: iconSize,
          style: ButtonStyle(
            minimumSize: WidgetStateProperty.all(sizeOfButton),
            padding: WidgetStateProperty.all(const EdgeInsets.all(12)),
          ),
          onPressed: onPressed,
          icon: icon,
        ),
        belowButton ?? Container(),
      ],
    );
  }
}
