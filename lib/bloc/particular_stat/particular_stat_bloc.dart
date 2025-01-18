import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import '../general_stat/statistic_model.dart';

part 'particular_stat_event.dart';

part 'particular_stat_state.dart';

class ParticularStatBloc
    extends Bloc<ParticularStatEvent, ParticularStatState> {
  ParticularStatBloc() : super(ParticularStatState(null)) {
    on<GetDate>(_onGetData);
  }

  _onGetData(GetDate event, Emitter<ParticularStatState> emit) async {
    emit(ParticularStatState(state.stat, isLoading: true));

    var response = await http.get(
        Uri.parse(
            'https://zala.pythonanywhere.com/statistic/?param=${event.pattern}'),
        headers: {'content-type': 'application/json'});

    if (response.statusCode == 200) {
      var data = StatisticModel.fromJson(jsonDecode(response.body));

      emit(ParticularStatState(data));
    }
    emit(ParticularStatState(state.stat, isLoading: false));
  }
}
