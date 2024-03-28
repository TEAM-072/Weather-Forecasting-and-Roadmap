import 'package:flutter/material.dart';
import 'package:akdr_weather/Map/LoadingMap.dart';
import 'package:akdr_weather/Activity/City.dart';
import 'package:akdr_weather/Utilities/Constants.dart';
import 'package:akdr_weather/Services/Weather.dart';
import 'package:akdr_weather/Services/epochconv.dart';
import 'package:akdr_weather/Map/MapImg.dart';

String CR = "";

class LocationAct extends StatefulWidget {
  LocationAct({this.locationWeather});

  final locationWeather;

  @override
  _LocationAct createState() => _LocationAct();
}

String rt = "", st = "";

class _LocationAct extends State<LocationAct> {
  WeatherModel weather = WeatherModel();

  int temp = 0;
  double ws = 0;
  String WeatherICON = "";
  String City = "";
  String ImageName = "";

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temp = 0;
        WeatherICON = 'Error'; // city = '';
        return;
      }

      double tmp = weatherData['main']['temp'];
      ws = weatherData['wind']['speed'];
      temp = tmp.toInt();

      int srtime = weatherData['sys']['sunrise'];
      int sstime = weatherData['sys']['sunset'];

      rt = risetime(srtime);
      st = setime(sstime);

      var condition = weatherData['weather'][0]['id'];

      WeatherICON = weather.getWeatherIcon(condition);
      ImageName = weather.getWeatherImage(temp);
      City = weatherData['name'];
      clothRec(temp);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Images/appbg.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();

                      updateUI(weatherData);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return
                                // MapImage();
                                LoadingMap(
                              cityName: City,
                            );
                          },
                        ),
                      );
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      ); // print(typedName);
                      if (typedName != null) {
                        var weatherData =
                            await weather.getCityWeather(typedName);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      // $WeatherICON
                      '\t\t\t\t\t\t\t\t\t\t\t\t\tTemp: $temp°\n\t\t\t\t\t\t\t\t\t\t\t\t\t\tLocation: $City \n\t\t\t\t\t\t\t\t\t\t\t\t\t\tWindspeed: $ws\n\t\t\t\t\t\t\t\t\t\t\t\t\t\tSunrise: $rt\n\t\t\t\t\t\t\t\t\t\t\t\t\t\tSunset: $st',
                      style: kTempTextStyle,
                    ),
                    // Text(
                    //   '\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tTemp: $temp°\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tLocation: $City $WeatherICON\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tWindspeed: $ws\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tSunrise: $rt\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tSunset: $st',
                    //   style: kTempTextStyle,
                    // ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "\tCloth Recommendation: $CR\t",
                        style: TextStyle(
                            fontFamily: "SF",
                            fontSize: 15,
                            color: Colors.white),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

void clothRec(int temp) {
  if (temp >= 30) {
    CR = "It's hot outside.\nWear light and breathable clothes.";
  } else if (temp >= 20) {
    CR = "It's warm outside.\nWear comfortable clothes.";
  } else if (temp >= 10) {
    CR = "It's cool outside.\nWear layers to stay warm.";
  } else if (temp >= 0) {
    CR = "It's cold outside.\nWear a jacket or coat.";
  } else {
    CR = "It's freezing outside.\nDress warmly and consider layers.";
  }
}
