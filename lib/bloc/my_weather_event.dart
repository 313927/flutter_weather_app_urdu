
part of 'my_weather_bloc.dart';


abstract class MyWeatherEvent extends Equatable {
  const MyWeatherEvent();
  @override
  List<Object> get props => [];
}
class FetchWeatherEvent extends MyWeatherEvent{
        final Position position;
        FetchWeatherEvent(this.position);

        @override
        List<Object> get props => [position];
}