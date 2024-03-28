import 'package:akdr_weather/Services/Location.dart';
import 'package:akdr_weather/Services/Networking.dart';
import 'package:akdr_weather/Activity/LocationAct.dart';
import 'package:akdr_weather/Services/epochconv.dart';

const apikey = 'Your API KEY';

String loc = "";

class WeatherModel {
  double longitude = 0;
  double latitude = 0;

  Future<dynamic> getCityWeather(String cityName) async {
    var url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apikey&units=metric';

    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.lat;
    longitude = location.long;
    NetworkHelper networkhelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apikey&units=metric');
    var weatherData = await networkhelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      // clothRec("There is Signs of ThunderStroms, don't go Outside \n :)");
      return '\t🌩\t';
    } else if (condition < 400) {
      // clothRec("Wear Cotton, Polyester or Nylon based Cloths\n");
      return '\t🌧\t';
    } else if (condition < 600) {
      // clothRec("Wear Cotton, Polyester or Nylon based Cloths\n");
      return '\t☔️\t';
    } else if (condition < 700) {
      // clothRec("Wear Sweaters, Gloves and Winter Shoes\n");
      return '\t☃️\t';
    } else if (condition < 800) {
      return '\t🌫\t';
    } else if (condition == 800) {
      // clothRec("Wear Cotton or Linen Based Cloths\n");
      return '\t☀️\t';
    } else if (condition <= 804) {
      return '\t☁️\t';
    } else {
      return '\t🤷\t$loc';
    }
  }

  String getWeatherImage(int condition) {
    if (condition < 10) {
      return 'Snow';
    } else if (condition < 20) {
      return 'Winter';
    } else if (condition < 26) {
      return 'Rain';
    } else if (condition >= 26) {
      return 'Sun';
    } else {
      return "Error Fetching Data";
    }
  }
}
