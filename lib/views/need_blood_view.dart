import 'package:blood_donation/core/colors.dart';
import 'package:blood_donation/update_list_cubit/cubit/personal_info_cubit.dart';
import 'package:blood_donation/views/bottom_nav_bar.dart';
import 'package:blood_donation/views/primary_button.dart';
import 'package:blood_donation/widgets/age_field.dart';
import 'package:blood_donation/widgets/hosital_address_field.dart';
import 'package:blood_donation/widgets/hospital_name_field.dart';
import 'package:blood_donation/widgets/phone_field.dart';
import 'package:blood_donation/widgets/username_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class INeedBloodView extends StatefulWidget {
  const INeedBloodView({super.key});

  @override
  State<INeedBloodView> createState() => _INeedBloodViewState();
}

class _INeedBloodViewState extends State<INeedBloodView> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController hospitalController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController seekOrDonate = TextEditingController();

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(
        value: "A+",
        child: Text("A+"),
      ),
      DropdownMenuItem(
        value: "A-",
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

  List<DropdownMenuItem<String>> get dropdownItemsSeekOrDonate {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(
        value: "Seeker",
        child: Text("Seeker"),
      ),
      DropdownMenuItem(
        value: "Donner",
        child: Text("Donner"),
      ),
    ];
    return menuItems;
  }

  String selectedValue = 'A+';
  String selectedValueSeekOrDonate = 'Seeker';

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
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
                          value: selectedValueSeekOrDonate,
                          borderRadius: BorderRadius.circular(12),
                          items: dropdownItemsSeekOrDonate,
                          onChanged: (value) {
                            setState(() {
                              selectedValueSeekOrDonate = value!;
                            });
                          }),
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
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                PrimaryButton(
                  label: 'Submit',
                  onPressed: () {
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
                        'type': selectedValueSeekOrDonate,
                        // Add more fields as needed
                      });
                      context.read<PersonalInfoCubit>().addPersonalInfo({
                        'username': userNameController.text,
                        'phone': phoneController.text,
                        'age': ageController.text,
                        'hospitalName': hospitalController.text,
                        'address': addressController.text,
                        'bloodType': selectedValue,
                        'type': selectedValueSeekOrDonate,
                        // Add more fields as needed
                      });

                      showSnackBar(
                          'your data is saved successfully', Colors.green);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BottomNavBar()));
                    } on Exception catch (e) {
                      print('firebase excption $e');
                    }
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
