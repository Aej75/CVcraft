import 'package:flutter/material.dart';

class RoundButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Icon iconData;
  // int number;
  // final List<String> count;
  const RoundButton(
      {super.key,
      required this.onPressed,
      this.iconData = const Icon(Icons.add)});

  @override
  State<RoundButton> createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      style: IconButton.styleFrom(
        elevation: 2,
        padding: const EdgeInsets.all(5),
        minimumSize: Size.zero,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: widget.iconData,
    );
  }
}
