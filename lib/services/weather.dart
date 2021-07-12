import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'f9e51e2a1c21397616df28d563c4420b';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    Networking networking = Networking(
        url: '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await networking.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    Networking networking = Networking(
        url:
            '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networking.getData();
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

  String getBackground(int condition) {
    if (condition < 300) {
      return 'weather.001.jpeg';
    } else if (condition < 400) {
      return 'weather.002.jpeg';
    } else if (condition < 600) {
      return 'weather.002.jpeg';
    } else if (condition < 700) {
      return 'weather.003.jpeg';
    } else if (condition < 800) {
      return 'weather.004.jpeg';
    } else if (condition == 800) {
      return 'weather.005.jpeg';
    } else if (condition <= 804) {
      return 'weather.006.jpeg';
    } else {
      return 'weather.007.jpeg';
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
