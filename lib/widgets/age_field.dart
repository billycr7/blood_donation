import 'package:blood_donation/core/colors.dart';
import 'package:flutter/material.dart';

class AgeTextField extends StatelessWidget {
  const AgeTextField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 279,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.phone, // Displays phone keyboard

        decoration: const InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'age',
          hintStyle: TextStyle(color: AppColors.primiryColor),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
