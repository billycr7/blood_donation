import 'package:blood_donation/core/colors.dart';
import 'package:flutter/material.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 279,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.phone, // Displays phone keyboard
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please Enter a phone number";
          }
          if (value.length < 11) {
            return "please enter a valid phone number ";
          }
          return null;
        },

        decoration: const InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Phone Number',
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
