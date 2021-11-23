import 'package:my_weather_app/helper/constants.dart';
import 'package:recase/recase.dart';

class Weather {
  final _temp;
  final _windspedd;
  final String _description;
  final _cityname;
  final _humidity;
  String icon;
  DateTime? date;

  get temp => _temp;

  get windspedd => _windspedd;

  get description => _description.titleCase;

  get cityname => _cityname;

  get humidity => _humidity;
  

  Weather(this._temp, this._windspedd, this._description, this._cityname,
      this._humidity, this.icon, this.date);

  factory Weather.fromjson(Map<String, dynamic> jsondata) {
    return Weather(
        jsondata['main']['temp'],
        jsondata['wind']['speed'],
        jsondata['weather'][0]['description'],
        jsondata['name'],
        jsondata['main']['humidity'],
        jsondata['weather'][0]['icon'],
        DateTime.tryParse(jsondata['dt_txt'].toString()));
  }
  String genertateIcon() {
    switch (icon) {
      case '01d':
        return d_1;
      case '02d':
        return d_2;
      case '03d':
        return d_3;
      case '04d':
        return d_4;
      case '09d':
        return d_9;
      case '10d':
        return d_10;
      case '11d':
        return d_11;
      case '13d':
        return d_13;
      case '50d':
        return d_50;
      case '01n':
        return n_1;
      case '02n':
        return n_2;
      case '03n':
        return n_2;
      case '04n':
        return n_4;
      case '09n':
        return n_9;
      case '10n':
        return n_10;
      case '11n':
        return n_11;
      case '13n':
        return n_13;
      case '50n':
        return n_50;
    }
    return d_1;
  }
}
