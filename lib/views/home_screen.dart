import 'package:blood_donation/core/colors.dart';
import 'package:blood_donation/views/need_blood_view.dart';
import 'package:blood_donation/views/primary_button.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              const Text(
                'Hello again',
                style: TextStyle(
                    color: AppColors.primiryColor,
                    fontSize: 40,
                    fontWeight: FontWeight.w600),
              ),
              const Text(
                'tell us what you need',
                style: TextStyle(
                  color: AppColors.primiryColor,
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              PrimaryButton(
                label: 'I need blood',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const INeedBloodView()));
                },
                height: 69,
                width: 238,
                fontSize: 32,
              ),
              const SizedBox(
                height: 10,
              ),
              PrimaryButton(
                label: 'Donate blood',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const INeedBloodView()));
                },
                height: 69,
                width: 238,
                fontSize: 32,
              )
            ],
          ),
        ),
      ),
    );
  }
}
