import 'package:flutter/material.dart';
import 'package:travelify/widgets/app_text.dart';

class AppButtons extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final Color color;
  final Color backgroundColor;
  final double size;
  final Color borderColor;
  final bool? isIcon;
  const AppButtons({
    super.key,
    required this.size,
    this.isIcon = false,
    this.icon,
    this.text = 'Hi',
    required this.color,
    required this.backgroundColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
      child: isIcon == false
          ? Center(
              child: AppText(
                text: text!,
                color: color,
              ),
            )
          : Center(
              child: Icon(
                icon,
                size: 40,
                color: color,
              ),
            ),
    );
  }
}
