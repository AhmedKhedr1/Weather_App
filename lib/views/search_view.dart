// ignore_for_file: camel_case_types

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/Weather_model.dart';
import 'package:weather_app/services/Weather_service.dart';

class Search_View extends StatelessWidget {
  const Search_View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search a city ',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              WeatherModel weatherModel = await weatherservice(Dio())
                  .getcurrentweather(cityname: value);
                  var get_weather_cubit=BlocProvider.of<GetWeatherCubit>(context);
                  get_weather_cubit.getcurrentWeather(cityname: value);
                  Navigator.pop(context);
            },
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(25),
                label: Text(
                  'search',
                  style: TextStyle(fontSize: 18),
                ),
                hintText: 'Enter City Name .',
                hintStyle: TextStyle(fontSize: 18),
                suffixIcon: Icon(Icons.search),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffFEAA40))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffFEAA40)))),
          ),
        ),
      ),
    );
  }
}
