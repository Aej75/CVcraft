import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class CvTile extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final Color backgroundColor;
  final Color textColor;
  const CvTile(
      {super.key,
      required this.title,
      this.backgroundColor = Colors.white,
      this.textColor = Colors.black,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 2,
        // foregroundColor: textColor,
        backgroundColor: backgroundColor,
        padding: EdgeInsets.zero,
      ),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w500, color: textColor),
      ).padding(all: 15),
    );
  }
}
