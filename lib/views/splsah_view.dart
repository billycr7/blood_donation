import 'package:blood_donation/core/colors.dart';
import 'package:blood_donation/core/images.dart';
import 'package:blood_donation/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // hide the status bar and navgation bar by setting the mode to immersive
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LogInView()),
      );
    });
  }

  @override
  void dispose() {
    // show the status bar and navgation bar after pushing to home screen and returing to standred mode
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primiryColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 150),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SvgPicture.asset(AppImages.blood),
              SvgPicture.asset(AppImages.group),
            ],
          ),
        ),
      ),
    );
  }
}
