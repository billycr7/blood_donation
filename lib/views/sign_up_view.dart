import 'package:blood_donation/core/colors.dart';
import 'package:blood_donation/views/login_view.dart';
import 'package:blood_donation/views/primary_button.dart';
import 'package:blood_donation/widgets/age_field.dart';
import 'package:blood_donation/widgets/email_text_field.dart';
import 'package:blood_donation/widgets/password_text_field.dart';
import 'package:blood_donation/widgets/phone_field.dart';
import 'package:blood_donation/widgets/username_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _form = GlobalKey<FormState>();

  final TextEditingController _userNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _phoneNumberController = TextEditingController();

  final TextEditingController _ageController = TextEditingController();

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
            child: Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
                const Center(
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      color: AppColors.primiryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                UserNameFormField(
                  controller: _userNameController,
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
                  controller: _passwordController,
                ),
                const SizedBox(
                  height: 10,
                ),
                PhoneTextField(
                  controller: _phoneNumberController,
                ),
                const SizedBox(
                  height: 10,
                ),
                AgeTextField(
                  controller: _ageController,
                ),
                const SizedBox(
                  height: 10,
                ),
                PrimaryButton(
                  label: 'Submit',
                  onPressed: () {
                    signUp(context);
                  },
                  height: 43,
                  width: 279,
                  fontSize: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signUp(BuildContext context) async {
    if (_form.currentState!.validate()) {
      //Setting isLoading to true before the actual registration starts ensures the loading indicator appears
      //immediately, giving the user a better understanding that something is happening.
      setState(() {
        isLoading = true;
      });
      String userName = _userNameController.text.trim();
      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();
      String phoneNumber = _phoneNumberController.text.trim();
      String age = _ageController.text.trim();

      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // If user is registered successfully, update user profile with username
        if (userCredential.user != null) {
          await userCredential.user!.updateDisplayName(userName);

          // Store additional user information in Firestore
          CollectionReference users =
              FirebaseFirestore.instance.collection('users');

          // Save user information to Firestore
          await users.doc(userCredential.user!.uid).set({
            'username': userName,
            'email': email,
            'phoneNumber': phoneNumber,
            'age': age,
            // Add more fields as needed
          });
        }
        showSnackBar('You Registered Successfully now login', Colors.green);
        if (context.mounted) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LogInView()));
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          showSnackBar("The password provided is too weak.", Colors.red);
        } else if (e.code == 'email-already-in-use') {
          showSnackBar("email is already in use", Colors.red);
        }
      } catch (e) {
        // Handle registration failure
        showSnackBar('Error during user registration: $e', Colors.red);
        // Display an error message or handle the error accordingly
      }
      setState(() {
        isLoading = false;
      });
    } else {}
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
