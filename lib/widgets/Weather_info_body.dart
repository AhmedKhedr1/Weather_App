// ignore_for_file: camel_case_types, file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:weather_app/models/Weather_model.dart';

class Weather_info_body extends StatelessWidget {
  WeatherModel weatherModel;
   Weather_info_body({
    super.key,required this.weatherModel
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(weatherModel.cityname,
            style:const TextStyle(
                
                fontSize: 25,
                fontWeight: FontWeight.w600),
          ),
          Text('updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
              style:const TextStyle(
                  
                  fontSize: 25,
                  fontWeight: FontWeight.w600)),
        const SizedBox(
          height: 35,
         ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network('https:${weatherModel.image}',),
              Text(weatherModel.temp.toString() ,style:const TextStyle(
                 fontSize: 25, fontWeight: FontWeight.w600)),
              Column(
                children: [
                  Text('maxtemp:${weatherModel.maxtemp}',
                      style:const TextStyle(
                          
                          fontSize: 20,
                          fontWeight: FontWeight.w500)),
                  Text('Mintemp:${weatherModel.mintemp}',
                      style:const TextStyle(
                          
                          fontSize: 20,
                          fontWeight: FontWeight.w500))
                ],
              )
            ],
          ),
         const SizedBox(
          height: 35,
         ),

          Text(weatherModel.wethearcondition, style:const TextStyle(
                 fontSize: 25, fontWeight: FontWeight.w600))
        ],
      ),
    );
  }
}
