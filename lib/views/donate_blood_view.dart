import 'package:blood_donation/core/colors.dart';
import 'package:blood_donation/views/bottom_nav_bar.dart';
import 'package:blood_donation/views/primary_button.dart';
import 'package:blood_donation/widgets/age_field.dart';
import 'package:blood_donation/widgets/hosital_address_field.dart';
import 'package:blood_donation/widgets/hospital_name_field.dart';
import 'package:blood_donation/widgets/phone_field.dart';
import 'package:blood_donation/widgets/username_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DonateBloodView extends StatefulWidget {
  const DonateBloodView({super.key});

  @override
  State<DonateBloodView> createState() => _INeedBloodViewState();
}

class _INeedBloodViewState extends State<DonateBloodView> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController hospitalController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(
        value: "A+",
        child: Text("A+"),
      ),
      DropdownMenuItem(
        value: "B-",
        child: Text("A-"),
      ),
      DropdownMenuItem(
        value: "B+",
        child: Text("B+"),
      ),
      DropdownMenuItem(
        value: "B-",
        child: Text("B-"),
      ),
      DropdownMenuItem(
        value: "O+",
        child: Text("O+"),
      ),
      DropdownMenuItem(
        value: "O-",
        child: Text("O-"),
      ),
      DropdownMenuItem(
        value: "AB+",
        child: Text("AB+"),
      ),
      DropdownMenuItem(
        value: "AB-",
        child: Text("AB-"),
      ),
    ];
    return menuItems;
  }

  String selectedValue = 'A+';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back)),
                    ],
                  ),
                ),
                const Text(
                  'Personal Information',
                  style: TextStyle(
                    color: AppColors.primiryColor,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                UserNameFormField(controller: userNameController),
                const SizedBox(
                  height: 10,
                ),
                PhoneTextField(controller: phoneController),
                const SizedBox(
                  height: 10,
                ),
                AgeTextField(controller: ageController),
                const SizedBox(
                  height: 10,
                ),
                HospitalNameFormFiled(controller: hospitalController),
                const SizedBox(
                  height: 10,
                ),
                HospitalAddressFormFiled(controller: addressController),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 48,
                  width: 143,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                      border: Border.all(
                        color: Colors.black,
                      )),
                  child: DropdownButton(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                      isDense: true,
                      value: selectedValue,
                      borderRadius: BorderRadius.circular(12),
                      items: dropdownItems,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value!;
                        });
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
                PrimaryButton(
                  label: 'Submit',
                  onPressed: () {
                    _saveUserDataToFirestore();
                  },
                  height: 43,
                  width: 279,
                  fontSize: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _saveUserDataToFirestore() {
    CollectionReference personalInfoCollection =
        FirebaseFirestore.instance.collection('personal_info');

    try {
      personalInfoCollection.add({
        'username': userNameController.text,
        'phone': phoneController.text,
        'age': ageController.text,
        'hospitalName': hospitalController.text,
        'address': addressController.text,
        'bloodType': selectedValue,
        // Add more fields as needed
      });
      showSnackBar('your data is saved successfullt', Colors.green);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const BottomNavBar()));
    } on Exception catch (e) {
      print('firebase excption $e');
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
