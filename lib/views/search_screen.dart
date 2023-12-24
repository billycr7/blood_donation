import 'package:blood_donation/core/colors.dart';
import 'package:blood_donation/update_list_cubit/cubit/personal_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SafeArea(
        child: BlocBuilder<PersonalInfoCubit, PersonalInfoState>(
          builder: (context, state) {
            if (state is PersonalInfoInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PersonalInfoLoaded) {
              return ListView.builder(
                itemCount: state.infoList.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> userData = state.infoList[index];
                  // Use userData to build your CustomPersonalInfoCard
                  return Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      height: 197,
                      width: 312,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 26, horizontal: 8),
                            height: 93,
                            width: 70,
                            decoration: const BoxDecoration(
                              color: Color(0xffFFF0F0),
                              borderRadius: BorderRadiusDirectional.all(
                                Radius.circular(8),
                              ),
                            ),
                            child: Text(
                              userData['bloodType'],
                              style: const TextStyle(
                                color: AppColors.primiryColor,
                                fontSize: 40,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 90,
                            top: 10,
                            child: Text(
                              userData['type'],
                              style: const TextStyle(
                                color: Color(0xff490008),
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 90,
                            top: 30,
                            child: Text(
                              userData['age'] + 'yr old',
                              style: const TextStyle(
                                color: Color(0xff490008),
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const Positioned(
                              left: 90, top: 65, child: Icon(Icons.person)),
                          Positioned(
                            left: 120,
                            top: 70,
                            child: Text(
                              userData['username'],
                              style: const TextStyle(
                                color: Color(0xff490008),
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const Positioned(
                              left: 90,
                              top: 90,
                              child: Icon(Icons.location_city)),
                          Positioned(
                            left: 120,
                            top: 95,
                            child: Text(
                              userData['address'],
                              style: const TextStyle(
                                color: Color(0xff490008),
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const Positioned(
                              left: 90, top: 120, child: Icon(Icons.call)),
                          Positioned(
                            left: 120,
                            top: 125,
                            child: Text(
                              userData['phone'],
                              style: const TextStyle(
                                color: Color(0xff490008),
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 250,
                            top: 130,
                            child: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                context
                                    .read<PersonalInfoCubit>()
                                    .deletePersonalInfo(index);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is PersonalInfoError) {
              return Center(
                child: Text('Error: ${state.errorMessage}'),
              );
            }
            return const SizedBox(); // Default empty state
          },
        ),
      ),
    );
  }
}
