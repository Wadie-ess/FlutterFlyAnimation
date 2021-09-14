import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_weather_app/model/weather_model.dart';

class Weatherdata with ChangeNotifier {

 Weather w2 = Weather(20, 0,'null','null',20);
  Future<void> getdata() async {
    final response = await http.Client().get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=settat&units=metric&appid=a28a016483ca44a1816fb6b8a2e0cf4f"));
    //https://api.openweathermap.org/data/2.5/weather?q=settat&appid=a28a016483ca44a1816fb6b8a2e0cf4f
    final data = json.decode(response.body);
    print(data);
    print(data['name']);
    print(data['wind']['speed']);
    print(data['weather'][0]['description']);
    print(data['main']['temp']);
    print(data['main']['humidity']);


   w2 =    getwather(response.body);
    notifyListeners();
  }

  Weather getwather(final response) {
    final jsondata = json.decode(response);
    return Weather.fromjson(jsondata);
  }
}
