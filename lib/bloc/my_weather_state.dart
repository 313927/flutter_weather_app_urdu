part of 'my_weather_bloc.dart';

abstract class MyWeatherState extends Equatable {
  const MyWeatherState();
  @override
  List<Object> get props => [];
}


final class MyWeatherInitialState extends MyWeatherState {}
final class MyWeatherLoadingState extends MyWeatherState{}
final class MyWeatherFailureState extends MyWeatherState{}

final class MyWeatherSuccessState extends MyWeatherState{
  final Weather myWeather;
  MyWeatherSuccessState(this.myWeather);
  @override
  List<Object> get props => [];
}


