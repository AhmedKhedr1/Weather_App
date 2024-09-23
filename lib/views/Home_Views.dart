// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/No_weatherbody_widget.dart';
import 'package:weather_app/widgets/Weather_info_body.dart';

class home_view extends StatefulWidget {
  const home_view({super.key});

  @override
  State<home_view> createState() => _home_viewState();
}

class _home_viewState extends State<home_view> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const Search_View();
                },
              ));
            },
            icon: const Icon(Icons.search),
            color: Colors.white,
          )
        ],
        title: const Text(
          'Weather App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocBuilder<GetWeatherCubit,WeatherState>(
        builder: (context, State) {
          if(State is WeatherLoadingState){
            return no_weather_body();
          }else if(State is WeatherSucessState ){
            return Weather_info_body(weatherModel: State.weatherModel,);
          }else{
            return Text('oops there was an error ');
          }
      },),
    );
  }
}
