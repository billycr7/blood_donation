part of 'personal_info_cubit.dart';

@immutable
abstract class PersonalInfoState {}

class PersonalInfoInitial extends PersonalInfoState {}

class PersonalInfoLoaded extends PersonalInfoState {
  final List<Map<String, dynamic>> infoList;

  PersonalInfoLoaded(this.infoList);

  // You can add other constructors or helper methods as needed
}

class PersonalInfoError extends PersonalInfoState {
  final String errorMessage;

  PersonalInfoError(this.errorMessage);

  // You can add other constructors or helper methods as needed
}
