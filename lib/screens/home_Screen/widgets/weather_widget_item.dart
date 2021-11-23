import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_weather_app/animation/animation_hover.dart';
import 'package:my_weather_app/data/weather_data.dart';
import 'package:my_weather_app/helper/constants.dart';
import 'package:sizer/sizer.dart';

class WetherWidgetListItem extends StatelessWidget {
  const WetherWidgetListItem({
    Key? key,
    required this.weatherdata,
  }) : super(key: key);

  final Weatherdata weatherdata;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: weatherdata.weatherList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 21.w,
            height: 8.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                      height: 7.h,
                      width: 15.w,
                      child: AnimatedImage(icon: weatherdata.weatherList[index].genertateIcon())),
                ),
                Text(
                    DateFormat.Hm()
                        .format(weatherdata.weatherList[index].date!),
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.6), fontSize: 11.sp)),
                Text(
                  weatherdata.weatherList[index].temp.toStringAsFixed(0) + '°C',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                      fontSize: 17.sp),
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(100),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        );
      },
    );
  }
}
