import 'package:blood_donation/core/colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
      required this.label,
      required this.onPressed,
      required this.height,
      required this.width,
      required this.fontSize});

  final String label;
  final VoidCallback onPressed;
  final double height;
  final double width;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      height: height,
      minWidth: width,
      onPressed: onPressed,
      color: AppColors.primiryColor,
      child: Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: fontSize),
      ),
    );
  }
}
