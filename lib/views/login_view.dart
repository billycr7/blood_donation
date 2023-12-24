import 'package:blood_donation/core/colors.dart';
import 'package:blood_donation/views/bottom_nav_bar.dart';
import 'package:blood_donation/views/primary_button.dart';
import 'package:blood_donation/views/sign_up_view.dart';
import 'package:blood_donation/widgets/email_text_field.dart';
import 'package:blood_donation/widgets/password_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passController = TextEditingController();
  final GlobalKey<FormState> _form = GlobalKey();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Form(
          key: _form,
          child: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Column(
                  children: [
                    const Text(
                      'Blood Donation',
                      style: TextStyle(
                          color: AppColors.primiryColor,
                          fontSize: 30,
                          fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      'You can save a life by donating blood',
                      style: TextStyle(
                          color: AppColors.primiryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 120,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Login',
                            style: TextStyle(
                                color: AppColors.primiryColor,
                                fontSize: 25,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    EmailTextFormField(
                      controller: _emailController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    PasswrdTextFormField(
                      controller: _passController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    PrimaryButton(
                      label: 'Login',
                      onPressed: () {
                        login();
                      },
                      height: 43,
                      width: 279,
                      fontSize: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("don't have an account ?"),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpView()));
                          },
                          child: const Text(
                            'Register now',
                            style: TextStyle(color: AppColors.primiryColor),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login() async {
    try {
      if (_form.currentState!.validate()) {
        setState(() {
          isLoading = true;
        });
        String email = _emailController.text.trim();
        String pass = _passController.text.trim();
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: pass);

        // The mounted property of a BuildContext indicates whether the widget
        // associated with that context is currently part of the active widget tree. It returns true if the widget is mounted and false otherwise.
        if (context.mounted) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const BottomNavBar()));
        }
      }
    } on FirebaseAuthException catch (e) {
      // Handle different authentication errors
      if (e.code == 'user-not-found') {
        showSnackBar("No user found for that email.", Colors.red);
      } else if (e.code == 'wrong-password') {
        showSnackBar("Wrong password provided for that user", Colors.red);
      } else {
        // Display the specific Firebase authentication error message
        showSnackBar("${e.message}", Colors.red);
      }
    } catch (e) {
      // Handle other errors
      showSnackBar('Error during user login: $e', Colors.red);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void showSnackBar(message, color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(10)),
      behavior: SnackBarBehavior.floating,
    ));
  }
}
