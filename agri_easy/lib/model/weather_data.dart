import 'package:agri_easy/model/weather_data_current.dart';
import 'package:agri_easy/model/weather_data_daily.dart';
import 'package:agri_easy/model/weather_data_hourly.dart';

class WeatherData{
  final WeatherDataCurrent? current;
  final WeatherDataHourly? hourly;
  final WeatherDataDaily? daily;

  WeatherData([this.current,this.hourly, this.daily]);


  //funtion to fetch these values
  WeatherDataCurrent getCurrentWeather(){
    return current!;
  }
  WeatherDataHourly getHourlyWeather(){
    return hourly!;
  }
  WeatherDataDaily getDailyWeather(){
    return daily!;
  }
}