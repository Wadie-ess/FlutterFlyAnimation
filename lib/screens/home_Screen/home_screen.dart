import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:sizer/sizer.dart';

import 'package:my_weather_app/data/weather_data.dart';
import 'package:my_weather_app/helper/constants.dart';
import 'package:my_weather_app/model/weather_model.dart';

import 'widgets/weather_widget_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool dataisloded = false;

  @override
  void didChangeDependencies() {
     if (dataisloded == false) {
       final data = Provider.of<Weatherdata>(context);
       data.fecthWeatherList();
       dataisloded = true;
     }
     super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    //late Weather myweather   ;
    // myweather = data.getdata() as Weather;
    final weatherdata = Provider.of<Weatherdata>(context);
    // final icon = data.w2.genertateIcon();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: const ImageIcon(AssetImage(options)),
        actions: [
          SizedBox(height: 5.h, width: 10.w, child: SvgPicture.asset(user))
        ],
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: FutureBuilder<Weather>(
              future: weatherdata.getdata(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.connectionState == ConnectionState.none) {
                  return const Center(child: Text('connection non'));
                } else if (snapshot.hasError) {
                  return  Center(child: Text(snapshot.error.toString()));
                } else {
                //  print('a7a' + weatherdata.myay.length.toString());
                  final icon = snapshot.data!.genertateIcon();
                  final data = snapshot.data!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text(
                              '${data.cityname},Morocco',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 19.sp),
                            ),
                            Text(
                              'Currently',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(

                                //color: Colors.white,
                                height: 25.h,
                                width: 55.w,
                                child: SimpleShadow(
                                    color: Colors.black.withAlpha(200),
                                    offset: const Offset(0, 15),
                                    opacity: 0.3,
                                    child: Image.asset(icon))),
                            Text(
                              data.description,
                              style: TextStyle(
                                  color: Colors.white.withAlpha(150),
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 3.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  TodayWeathedata(
                                    title: 'Temp',
                                    value: '${data.temp}°C',
                                  ),
                                  TodayWeathedata(
                                    title: 'Wind Speed',
                                    value: '${data.windspedd}Km/h',
                                  ),
                                  TodayWeathedata(
                                    title: 'Humidity',
                                    value: '${data.humidity}%',
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3.h, vertical: 1.h),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Today',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.sp),
                                  ),
                                  Container(
                                    //height: 5.h,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),

                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        'View Full Report',
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            color: backgroundColor),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 100.w,
                              height: 20.h,
                              child: WetherWidgetListItem(weatherdata: weatherdata),
                            )

                          ],
                        ),
                      ),
                    ],
                  );
                }
              })),
    );
  }
}



class TodayWeathedata extends StatelessWidget {
  const TodayWeathedata({this.title, this.value});
  final String? title;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title!,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
              color: Colors.white),
        ),
        Text(
          value!,
          style: TextStyle(
              //fontWeight: FontWeight.bold,
              fontSize: 10.sp,
              color: Colors.white),
        )
      ],
    );
  }
}
