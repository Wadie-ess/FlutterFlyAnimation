
class Weather {
   final _temp;
  final _windspedd;
  final _description;
  final _cityname;
  final _humidity;

  get temp => _temp ;

  get windspedd => _windspedd;

  get description => _description ;

  get cityname => _cityname ;


  get humidity => _humidity;


  Weather(this._temp, this._windspedd, this._description, this._cityname,
      this._humidity);

  factory Weather.fromjson(Map<String, dynamic> jsondata) {
    return Weather(jsondata['main']['temp'], jsondata['wind']['speed'], jsondata['weather'][0]['main'],
        jsondata['name'],  jsondata['main']['humidity']);
  }
}
