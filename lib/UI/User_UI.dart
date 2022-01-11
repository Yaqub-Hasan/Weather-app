import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:weather_forcast/Model/WeatherForecastModel.dart';
import 'package:weather_forcast/Util/Api_ID.dart';

import 'getIconByWeather.dart';

Widget CtyCtryInfo(AsyncSnapshot<WeatherForecastModel> snapshot) {
  var ForecastList = snapshot.data!.list;
  var City = snapshot.data!.city.name;
  var Country = snapshot.data!.city.country;
  var DateTimeFormated =
      new DateTime.fromMillisecondsSinceEpoch(ForecastList[0].dt * 1000);
  return Container(
    width: 400,
    height: 300,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.blue, width: 2),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.only(top: 10)),
        Text(
          "$City" + " , " + "$Country",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        Text(
          "${Api_ID.getDate(DateTimeFormated)}",
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        SizedBox(
          height: 10,
        ),
        getIconByWeather(ForecastList[0].weather[0].main),
        Padding(padding: EdgeInsets.only(top: 10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${(KalvinToCelsius(ForecastList[0].main.temp)).toStringAsFixed(1)}  °C",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              width: 15,
            ),
            Text(" ${ForecastList[0].weather[0].description}",
                style: TextStyle(fontSize: 15))
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.center,
          height: 3,
          width: 300,
          color: Colors.orange,
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text("${ForecastList[0].main.humidity} %",style: TextStyle(fontSize: 20),),
                Icon(
                  LineIcons.eyeDropper,
                  color: Colors.orange,
                  size: 35,
                )
              ],
            ),
            SizedBox(width: 25,),
            Column(
              children: [
                Text("${ForecastList[0].wind.speed} Km/h",style: TextStyle(fontSize: 20),),
                Icon(
                  LineIcons.wind,
                  color: Colors.orange,
                  size: 35,
                )
              ],
            ),
            SizedBox(width: 25,),
            Column(
              children: [
                Text("${KalvinToCelsius(ForecastList[0].main.tempMax).toStringAsFixed(0)} °C " ,style: TextStyle(fontSize: 20),),
                Icon(
                  LineIcons.highTemperature,
                  color: Colors.orange,
                  size: 35,
                )
              ],
            )
          ],
        )
      ],
    ),
  );
}

//======Temperature transform=====  Celsius
KalvinToCelsius(double temp){
  return temp-273.5;
}
