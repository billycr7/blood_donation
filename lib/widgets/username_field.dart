import 'package:blood_donation/core/colors.dart';
import 'package:flutter/material.dart';

class UserNameFormField extends StatelessWidget {
  const UserNameFormField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 279,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please a valid username';
          }
          if (value.length < 3) {
            return 'Username must be at least 3 characters';
          }
          return null;
        }, // Displays phone keyboard

        decoration: const InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Username',
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
