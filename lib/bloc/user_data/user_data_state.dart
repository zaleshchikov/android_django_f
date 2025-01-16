part of 'user_data_bloc.dart';

class UserDataState {
  String projectName;
  String name;
  String group;
  bool isLoading;

  UserDataState(this.projectName, this.name, this.group, {this.isLoading = false});
}

