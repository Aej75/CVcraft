import 'package:flutter/material.dart';

class BluePrint extends StatelessWidget {
  final String? title;
  final Widget body;
  final bool noPadding;
  final Color background;

  const BluePrint(
      {super.key,
      this.title,
      required this.body,
      this.noPadding = false,
      this.background = const Color.fromARGB(255, 86, 163, 252)});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: background, body: body),
    );
  }
}
