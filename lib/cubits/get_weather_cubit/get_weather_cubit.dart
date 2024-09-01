import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/Weather_model.dart';
import 'package:weather_app/services/Weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  
  GetWeatherCubit() : super(WeatherInitialState());

  getcurrentWeather({required String cityname}) async {
    try {
  WeatherModel weatherModel =
      await weatherservice(Dio()).getcurrentweather(cityname: cityname);
      emit(WeatherLoadedState(weatherModel:weatherModel ));
} on Exception catch (e) {
  emit(WeatherFailureState());
}
        
  }
}
