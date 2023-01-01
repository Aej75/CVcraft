import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class CvTitle extends StatelessWidget {
  final String title;
  final Color? color;
  const CvTitle({super.key, required this.title, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500, color: color),
    ).padding(left: 25);
  }
}
