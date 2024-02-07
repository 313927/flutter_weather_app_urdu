import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/data/my_data.dart';

part 'my_weather_event.dart';
part 'my_weather_state.dart';

class MyWeatherBloc extends Bloc<MyWeatherEvent, MyWeatherState> {
  MyWeatherBloc() : super(MyWeatherInitialState()) {
    on<FetchWeatherEvent>((event, emit) async {
      emit(MyWeatherLoadingState());
      try{
        WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);
        Weather weather = await wf.currentWeatherByLocation(
            event.position.latitude,
            event.position.longitude,
        );
        print(weather);
        emit(MyWeatherSuccessState(weather));
      }catch(e){
          emit(MyWeatherFailureState());
      }
    });
  }
}
