import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_weather_app/model/weather_model.dart';

class Weatherdata with ChangeNotifier {
late List<Weather> weatherList = [];
  Future<Weather> getdata() async {
    final response = await http.Client().get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=settat&units=metric&appid=a28a016483ca44a1816fb6b8a2e0cf4f"));
    //https://api.openweathermap.org/data/2.5/weather?q=settat&appid=a28a016483ca44a1816fb6b8a2e0cf4f
    if (response.statusCode != 200) {
      throw Exception();
    }

    final data = json.decode(response.body);
    // print(data);
    // print(data['name']);
    // print(data['wind']['speed']);
    // print(data['weather'][0]['description']);
    // print(data['weather'][0]['icon']);
    // print(data['main']['temp']);
    // print(data['main']['humidity']);

    return getwather(response.body);
    //notifyListeners();
  }

  Future<void> fecthWeatherList() async {
    final data = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/forecast?q=settat&cnt=5&units=metric&appid=a28a016483ca44a1816fb6b8a2e0cf4f'));
    final jsonstring = jsonDecode(data.body);
    weatherList = getlist(jsonstring['list']);
    final List<Weather> my = getlist(jsonstring['list']);
    my.forEach((element) {
      print(element.description);
      print(element.humidity);
      print(element.temp);
      print(element.icon);
      print(element.date);
      print('\n');
    });
  }

  // list
  static List<Weather> getlist(List<dynamic> a7a) {
    List<Weather> my = a7a.map((e) => Weather.fromjson(e)).toList();     
    return my;
  }

  //sigle object
  Weather getwather(final response) {
    final jsondata = json.decode(response);
    return Weather.fromjson(jsondata);
  }
}
