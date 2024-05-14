part of 'weather_bloc.dart';

abstract class WeatherEvent {}

class WeatherUpdateEvent extends WeatherEvent {
  final String address;
  WeatherUpdateEvent(this.address);
}
