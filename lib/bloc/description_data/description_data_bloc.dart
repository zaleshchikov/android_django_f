import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'description_data_event.dart';
part 'description_data_state.dart';

class DescriptionDataBloc extends Bloc<DescriptionDataEvent, DescriptionDataState> {
  DescriptionDataBloc() : super(DescriptionDataState('', '', '', '')) {
    on<GetData>(_onGetData);
  }

  _onGetData(GetData event, Emitter<DescriptionDataState> emit) async {
    emit(DescriptionDataState(state.desc, state.url1, state.url2, state.url3,
        isLoading: true));

    var response = await http.get(Uri.parse('https://zala.pythonanywhere.com/profession_description'), headers: {'content-type': 'application/json'});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      emit(DescriptionDataState(data['description'], data['title_img'], data['description_img'], data['end_img']));
    }
    emit(DescriptionDataState(state.desc, state.url1, state.url2, state.url3,
        isLoading: false));
  }
}
