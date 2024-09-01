// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';

class no_weather_body extends StatelessWidget {
  const no_weather_body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.all(15),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'there is no Weather 😔 ... Start search now 🔎 ',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
          )
        ],
      ),
    );
  }
}
