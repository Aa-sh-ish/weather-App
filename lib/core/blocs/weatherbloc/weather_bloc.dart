import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/common/utils/utils.dart';
import 'package:weather_app/core/models/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitialState()) {
    on<WeatherUpdateEvent>((event, emit) async {
      log("bloc hit");
      emit(WeatherLoadingState());
      log("loding state emitted");
      try {
        var response = await http
            .get(Uri.parse("${ApiProvider().baseUrl}${event.address}"));
        if (response.statusCode == 200) {
          WeatherModel weatherModel =
              WeatherModel.fromJson(jsonDecode(response.body));
          emit(WeatherLoadedState(weatherModel));
          log("Loaded state emitted");
        } else {
          emit(WeatherErrorState(
              error: jsonDecode(response.body)['error']['message']));
          log("Error Sate emitted");
        }
      } catch (e) {
        emit(WeatherErrorState(error: e.toString()));
        log("catch erroe");
      }
    });
  }
}
