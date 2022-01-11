import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

getIconByWeather (String weatherCondition){
  if(weatherCondition == "Clouds")
    {
      return Icon(LineIcons.cloud ,  size: 72 , color: Colors.blueGrey);
    }
  else if(weatherCondition == "Clear"){
    return Icon(LineIcons.sun , size: 72 , color: Colors.yellow);
  }else if(weatherCondition == "Rain"){
    return Icon(LineIcons.cloudWithRain , size: 72 , color: Colors.blue);
  }else if(weatherCondition == "Snow"){
    return Icon(LineIcons.snowman , size: 72 , color: Colors.orange );
  }else{
    return Icon(LineIcons.wind , size: 72,);
  }
}


getIconByWeatherCard(String weatherCondition){
  if(weatherCondition == "Clouds")
  {
    return Icon(LineIcons.cloud ,  size: 50 , color: Colors.orange);
  }
  else if(weatherCondition == "Clear"){
    return Icon(LineIcons.sun , size: 50 , color: Colors.orange);
  }else if(weatherCondition == "Rain"){
    return Icon(LineIcons.cloudWithRain , size: 50 , color: Colors.orange);
  }else if(weatherCondition == "Snow"){
    return Icon(LineIcons.snowman , size: 50 , color: Colors.orange );
  }else{
    return Icon(LineIcons.wind , size: 50, color: Colors.orange,);
  }
}

