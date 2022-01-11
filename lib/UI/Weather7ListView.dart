
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:weather_forcast/Model/WeatherForecastModel.dart';
import 'package:weather_forcast/UI/getIconByWeather.dart';
import 'package:weather_forcast/Util/Api_ID.dart';

import 'User_UI.dart';

Weather7ListView(AsyncSnapshot<WeatherForecastModel> snapshot){
  var ForecastList = snapshot.data!.list;
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        height: 210,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context , index){
            return SizedBox(width: 8,);
          },
          itemCount: ForecastList.length,
          itemBuilder: (context  , index){
            return ClipRRect(
               borderRadius: BorderRadius.all(Radius.circular(12)),
               child: Container(
                 width: MediaQuery.of(context).size.width/2,
                 height: 180,
                 child: weatherCard(snapshot , index),
                 decoration: BoxDecoration(
                   gradient: LinearGradient(colors: [Colors.orange , Colors.blue] , begin: Alignment.topRight,
                   end: Alignment.bottomLeft
                   )
                 ),
               ),
            );
          },
        ),
      ),
    ],
  );

}


weatherCard(AsyncSnapshot<WeatherForecastModel> snapshot , int index){

  var ForecastList = snapshot.data!.list;
  var date = Api_ID.getDate(new DateTime.fromMillisecondsSinceEpoch(ForecastList[index].dt * 1000));
  var day = date.split(",")[0];
  var dayTime = ForecastList[index].dtTxt;
  var dayTimeClock = dayTime.split(" ")[1];
  var dayDate = dayTime.split(" ")[0];

  return Column(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Padding(padding: EdgeInsets.only(top: 15),),
    Text(day , style: TextStyle(color: Colors.white , fontSize: 18),),
    Text("$dayDate" , style: TextStyle(color: Colors.white),),
    Text("$dayTimeClock" , style: TextStyle(color: Colors.white),),
    Padding(padding: EdgeInsets.only(top: 5),),
    Container(
      alignment: Alignment.center,
      height: 3,
      width: 120,
      color: Colors.orange,
    ),
    Padding(padding: EdgeInsets.only(top: 5),),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Colors.white
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getIconByWeatherCard(ForecastList[index].weather[0].main),
                Padding(padding: EdgeInsets.only(top: 5),),
                Text("${(KalvinToCelsius(ForecastList[0].main.temp)).toStringAsFixed(0)}  °C" , style: TextStyle(fontSize: 15),)
              ],
            )
          ),
          SizedBox(width: 15,),
          Column(
            children: [
              Row(
                children: [
                  Icon(LineIcons.lowTemperature , color: Colors.white,),
                  SizedBox(width: 5,),
                  Text("${(KalvinToCelsius(ForecastList[0].main.tempMin)).toStringAsFixed(1)}  °C" , style: TextStyle(fontSize: 15 , color: Colors.white),),

                ],
              ),
              Padding(padding: EdgeInsets.only(top: 5),),
              Row(
                children: [
                  Icon(LineIcons.highTemperature , color: Colors.white,),
                  SizedBox(width: 5,),
                  Text("${(KalvinToCelsius(ForecastList[0].main.tempMax)).toStringAsFixed(1)}  °C" , style: TextStyle(fontSize: 15 , color: Colors.white),),

                ],
              ),
              Padding(padding: EdgeInsets.only(top: 5),),
              Row(
                children: [
                  Icon(LineIcons.eyeDropper, color: Colors.white,),
                  SizedBox(width: 5,),
                  Text("${(ForecastList[0].main.humidity).toStringAsFixed(2)}  %" , style: TextStyle(fontSize: 15 , color: Colors.white),),

                ],
              ),
            ],
          )
        ],
      ),
    )



  ],
);
}