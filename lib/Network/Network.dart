import 'dart:convert';
import 'package:http/http.dart';
import 'package:weather_forcast/Model/WeatherForecastModel.dart';
import 'package:weather_forcast/Util/Api_ID.dart';

class Network{
  Future<WeatherForecastModel> getWeather({required String CityName}) async{
    print("test 0");


    var url = "https://api.openweathermap.org/data/2.5/forecast?q="+CityName+"&appid="+Api_ID.key+"";
    Response response = await get(Uri.parse(url));

    //Watch the Print Process
    print("${Uri.parse(url)}");

    if(response.statusCode==200){
      print("Weather Info:" + response.body);
      return WeatherForecastModel.fromJson(json.decode(response.body));
    }else{
      throw Exception("Failed to get Weather Forecast");
    }
  }


}