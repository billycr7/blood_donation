import 'package:blood_donation/core/colors.dart';
import 'package:flutter/material.dart';

class PasswrdTextFormField extends StatelessWidget {
  const PasswrdTextFormField({super.key, required this.controller});
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
            return 'Please Enter a Password';
          }
          if (value.length < 5) {
            return 'Password must be at least 6 characters long';
          }
          return null;
        },
        decoration: const InputDecoration(
            fillColor: Colors.white,
            filled: true,
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
            hintText: 'Password',
            hintStyle: TextStyle(color: AppColors.primiryColor)),
      ),
    );
  }
}
