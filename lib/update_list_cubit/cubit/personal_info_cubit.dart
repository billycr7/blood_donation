import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'personal_info_state.dart';

class PersonalInfoCubit extends Cubit<PersonalInfoState> {
  PersonalInfoCubit() : super(PersonalInfoInitial());

  void addPersonalInfo(Map<String, dynamic> info) {
    List<Map<String, dynamic>> updatedList = [];

    if (state is PersonalInfoInitial) {
      updatedList = [info];
    } else if (state is PersonalInfoLoaded) {
      final currentState = state as PersonalInfoLoaded;
      updatedList = List.from(currentState.infoList)..add(info);
    }

    emit(PersonalInfoLoaded(updatedList));
  }

  void deletePersonalInfo(int index) {
    if (state is PersonalInfoLoaded) {
      final currentState = state as PersonalInfoLoaded;
      final List<Map<String, dynamic>> updatedList =
          List.from(currentState.infoList);
      updatedList.removeAt(index);
      emit(PersonalInfoLoaded(updatedList));
    }
  }
}
