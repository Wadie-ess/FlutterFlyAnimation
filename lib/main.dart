

import 'package:flutter/material.dart';
import 'package:my_weather_app/data/weather_data.dart';
import 'package:sizer/sizer.dart';
import 'package:my_weather_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
providers: [
  ChangeNotifierProvider(create: (context) => Weatherdata(),)
],    
    
    child: const MyApp()));
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (_, __, ___) {
      return MaterialApp(
        home: HomeScreen(
          key: key,
        ),
      );
    });
  }
}
