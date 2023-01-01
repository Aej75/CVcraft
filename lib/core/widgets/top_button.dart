import 'package:cv_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class TopButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData? icon;
  const TopButton({super.key, this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          elevation: 2,
          foregroundColor: kDarkBlueColor,
          backgroundColor: Colors.white,
          padding: EdgeInsets.zero,
          minimumSize: const Size(40, 40),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(icon),
        ),
      ),
    );
  }
}
