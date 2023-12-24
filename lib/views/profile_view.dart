import 'package:blood_donation/core/colors.dart';
import 'package:flutter/material.dart';

class Profileiew extends StatelessWidget {
  const Profileiew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                width: 278,
                height: 400,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                    ),
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 95,
                      top: 50,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(40)),
                        child: const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 40,
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 300,
                      left: 30,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                '0',
                                style: TextStyle(
                                    color: AppColors.primiryColor,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'points',
                                style: TextStyle(
                                    color: AppColors.primiryColor,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 75,
                          ),
                          Column(
                            children: [
                              Text(
                                '0',
                                style: TextStyle(
                                    color: AppColors.primiryColor,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Shares',
                                style: TextStyle(
                                    color: AppColors.primiryColor,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Positioned(
                      top: 140,
                      left: 70,
                      child: Text(
                        'Moustafa Mahmoud',
                        style: TextStyle(
                            color: AppColors.primiryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              // Container(
              //   height: 40,
              //   width: 200,
              //   padding: EdgeInsets.all(10),
              //   decoration: const BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.all(
              //       Radius.circular(12),
              //     ),
              //   ),
              //   child: const Text('Moustafa Mahmoud'),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
