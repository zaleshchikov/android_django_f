import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'user_data_event.dart';

part 'user_data_state.dart';

class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  UserDataBloc() : super(UserDataState('', '', '')) {
    on<GetDate>(_onGetData);
  }

  _onGetData(GetDate event, Emitter<UserDataState> emit) async {
    emit(UserDataState(state.projectName, state.name, state.group,
        isLoading: true));

    var response = await http.get(Uri.parse('https://zala.pythonanywhere.com//master_data'), headers: {'content-type': 'application/json'});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      emit(UserDataState(data['project_name'], data['name'],data['group']));
    }
    emit(UserDataState(state.projectName, state.name, state.group,
        isLoading: false));
  }
}
