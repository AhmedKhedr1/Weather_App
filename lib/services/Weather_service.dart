// ignore_for_file: file_names, camel_case_types

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app/models/Weather_model.dart';

class weatherservice {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String ApiKey = '9d38922107a046ce830201059243007';

  weatherservice(this.dio);

  Future<WeatherModel> getcurrentweather({required String cityname}) async {
    try {
      Response response = await dio.get(
          '$baseUrl/forecast.json?key=$ApiKey&q=$cityname&days=1&aqi=no&alerts=no');
      WeatherModel weathermodel = WeatherModel.fromjson(response.data);
      return weathermodel;
    } on DioException catch (e) {
      final String errormessage = e.response?.data['error']['message'] ??
          'oops there was an error ... please try later';
      throw Exception(errormessage);
    }catch (e){
      log(e.toString());
      throw Exception('oops there was an error , try later ');
    }
  }
}
