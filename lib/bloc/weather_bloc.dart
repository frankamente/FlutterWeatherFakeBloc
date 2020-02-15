import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_bloc_example/data/weather.dart';

import 'bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  @override
  WeatherState get initialState => WeatherInitial();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    yield WeatherLoading();
    if (event is GetWeather) {
      final Weather weather = await getWeather(event.cityName);
      yield WeatherLoaded(weather);
    }
  }

  getWeather(String cityName) async {
    return Future.delayed(Duration(seconds: 2), () {
      return Weather(
        cityName: cityName,
        temperatureCelsius: 20 + Random().nextInt(15) + Random().nextDouble(),
      );
    });
  }
}
