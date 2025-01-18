import 'dart:convert';

import 'package:android_django/bloc/general_stat/statistic_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'general_stat_event.dart';

part 'general_stat_state.dart';

class GeneralStatBloc extends Bloc<GeneralStatEvent, GeneralStatState> {
  GeneralStatBloc() : super(GeneralStatState(null, null, null, null, null)) {
    on<GetData>(_onGetData);
  }

  _onGetData(GetData event, Emitter<GeneralStatState> emit) async {
    emit(GeneralStatState(
        state.salary, state.salaryCity, state.count, state.ratio, state.skills,
        isLoading: true));

    var responseSalary = await http.get(
        Uri.parse('https://zala.pythonanywhere.com/statistic/?param=salary'),
        headers: {'content-type': 'application/json'});
    var responseSalaryCity = await http.get(
        Uri.parse('https://zala.pythonanywhere.com/statistic/?param=salary_city'),
        headers: {'content-type': 'application/json'});
    var responseCount = await http.get(
        Uri.parse('https://zala.pythonanywhere.com/statistic/?param=count'),
        headers: {'content-type': 'application/json'});
    var responseRatio = await http.get(
        Uri.parse('https://zala.pythonanywhere.com/statistic/?param=ratio'),
        headers: {'content-type': 'application/json'});
    var responseSkills = await http.get(
        Uri.parse('https://zala.pythonanywhere.com/statistic/?param=skills'),
        headers: {'content-type': 'application/json'});

    if (responseSalary.statusCode == 200) {
      var dataSalary = StatisticModel.fromJson(jsonDecode(responseSalary.body));
      var dataSalaryCity =
          StatisticModel.fromJson(jsonDecode(responseSalaryCity.body));
      var dataCount = StatisticModel.fromJson(jsonDecode(responseCount.body));
      var dataRatio = StatisticModel.fromJson(jsonDecode(responseRatio.body));
      var dataSkills = StatisticModel.fromJson(jsonDecode(responseSkills.body));

      emit(GeneralStatState(
          dataSalary, dataSalaryCity, dataCount, dataRatio, dataSkills));
    }
    emit(GeneralStatState(
        state.salary, state.salaryCity, state.count, state.ratio, state.skills,
        isLoading: false));
  }
}
