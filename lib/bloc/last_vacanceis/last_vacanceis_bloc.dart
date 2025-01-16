import 'dart:convert';

import 'package:android_django/bloc/last_vacanceis/vacancy_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'last_vacanceis_event.dart';
part 'last_vacanceis_state.dart';

class LastVacanceisBloc extends Bloc<LastVacanceisEvent, LastVacanceisState> {
  LastVacanceisBloc() : super(LastVacanceisState([])) {
    on<GetData>(_onGetData);
  }

  _onGetData(GetData event, Emitter<LastVacanceisState> emit) async {
    emit(LastVacanceisState(state.vacancies,
        isLoading: true));

    var response = await http.get(Uri.parse('https://zala.pythonanywhere.com/vacancies'), headers: {'content-type': 'application/json'});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Vacancy> vacancies = [];
      for(var e in data){
        vacancies.add(Vacancy.fromJson(e));
      }
      emit(LastVacanceisState(vacancies));
    }
    emit(LastVacanceisState(state.vacancies,
        isLoading: false));
  }
}
