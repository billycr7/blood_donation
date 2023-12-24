import 'package:blood_donation/core/colors.dart';
import 'package:flutter/material.dart';

class HospitalAddressFormFiled extends StatelessWidget {
  const HospitalAddressFormFiled({super.key, required this.controller});
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
            return 'Please a valid hospital Address';
          }
          if (value.length < 6) {
            return 'hospital name must be at least 3 characters';
          }
          return null;
        }, // Displays phone keyboard

        decoration: const InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Hospital Address',
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
