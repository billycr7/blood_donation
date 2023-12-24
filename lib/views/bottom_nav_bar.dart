import 'package:blood_donation/core/colors.dart';
import 'package:blood_donation/core/user_data.dart';
import 'package:blood_donation/views/home_screen.dart';
import 'package:blood_donation/views/profile_view.dart';
import 'package:blood_donation/views/search_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

int currentIndex = 0;

final pages = [
  const HomeView(),
  const SearchView(),
  const Profileiew(),
];

class _BottomNavBarState extends State<BottomNavBar> {
  void updateData({
    required String username,
    required String phone,
    required String age,
    required String hospitalName,
    required String address,
    required String bloodType,
  }) {
    // Update UserData fields here
    setState(() {
      UserData.username = username;
      UserData.phone = phone;
      UserData.age = age;
      UserData.hospitalName = hospitalName;
      UserData.address = address;
      UserData.bloodType = bloodType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.scaffoldColor,
          elevation: 0,
          selectedItemColor: Colors.black,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: currentIndex == 0
                  ? const Text(
                      'Home',
                      style: TextStyle(color: Colors.red, fontSize: 18),
                    )
                  : const Icon(
                      Icons.home,
                      size: 30,
                      color: Colors.black,
                    ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: currentIndex == 1
                  ? const Text(
                      'Search',
                      style: TextStyle(color: Colors.red, fontSize: 18),
                    )
                  : const Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.black,
                    ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: currentIndex == 2
                  ? const Text(
                      'Profile',
                      style: TextStyle(color: Colors.red, fontSize: 18),
                    )
                  : const Icon(
                      Icons.person,
                      size: 30,
                      color: Colors.black,
                    ),
              label: '',
            )
          ]),
      body: pages[currentIndex],
    );
  }
}
