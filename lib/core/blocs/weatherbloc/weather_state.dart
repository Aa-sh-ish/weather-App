part of 'weather_bloc.dart';

sealed class WeatherState {}

final class WeatherInitialState extends WeatherState {}

final class WeatherLoadingState extends WeatherState {}

final class WeatherLoadedState extends WeatherState {
  final WeatherModel weathermodel;
  WeatherLoadedState(this.weathermodel);
}

final class WeatherErrorState extends WeatherState {
  final String error;
  WeatherErrorState({required this.error});
}

// final class WeatherInitial extends WeatherState {}

