import 'package:weather_app/models/Weather_model.dart';

class WeatherState {

}
class WeatherLoadingState extends WeatherState{

}
class WeatherSucessState extends WeatherState{
WeatherModel weatherModel;
WeatherSucessState({required this.weatherModel});
  
}
class WeatherFailureState extends WeatherState{
  
}