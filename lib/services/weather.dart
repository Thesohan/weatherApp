import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';

const openWeatherMapUrl='https://api.openweathermap.org/data/2.5/weather';
const apiKey='c4dc74d5fba3d503c7467b7fe3e5f8c0';
class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();

    await location.getCurrentLocation();


    NetworkHelper networkHelper = NetworkHelper(
        url: "$openWeatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric");

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  Future getCityWeather(String city)async{
    String url ="$openWeatherMapUrl?q=$city&appid=$apiKey&units=metric";

    NetworkHelper networkHelper=NetworkHelper(url:url);
    var weatherData= await networkHelper.getData();
    return weatherData;
  }

    String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
