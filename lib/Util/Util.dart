import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:weather_forcast/Model/WeatherForecastModel.dart';
import 'package:weather_forcast/Network/Network.dart';
import 'package:weather_forcast/UI/User_UI.dart';
import 'package:weather_forcast/UI/Weather7ListView.dart';



class WeatherUI extends StatefulWidget {
  const WeatherUI({Key? key}) : super(key: key);

  @override
  _WeatherUIState createState() => _WeatherUIState();
}

class _WeatherUIState extends State<WeatherUI> {
  late Future<WeatherForecastModel> weatherObject ;
  String cityName = "London";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weatherObject = getWeatherForCity(cityName: cityName);

    //print(weatherObject); // this don't work
    weatherObject.then((value) {     // but this work perfectly
      print(value.city.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[800],
        title: Text("Weather Forecast"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          TextFieldWidget(),
          Padding(padding: EdgeInsets.only(top: 10)),
          Container(
            child: FutureBuilder<WeatherForecastModel>(
                future: weatherObject,
                builder: (context , AsyncSnapshot<WeatherForecastModel> snapshot){
                  if(snapshot.hasData){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CtyCtryInfo(snapshot),
                        Padding(padding: EdgeInsets.only(top: 20)),
                        Text("8 Times weather for each day during 7 Days :" , style: TextStyle(color: Colors.blue),),
                        Padding(padding: EdgeInsets.only(top: 20)),
                        Weather7ListView(snapshot)

                      ],
                    );
                  }
                  else{
                     return LinearProgressIndicator();
                  }
            }),
          )
        ],
      )

        );

  }
  Widget TextFieldWidget() {
    return TextField(
      onSubmitted:(value){
         setState(() {
           cityName = value;
           weatherObject = getWeatherForCity(cityName: cityName);
         });

      },
      style: TextStyle(color: Colors.blue[900]),
      decoration: InputDecoration(
          fillColor: Colors.orange.withOpacity(0.1),
          filled: true,
          contentPadding: EdgeInsets.all(10),
          prefixIcon: Icon(LineIcons.search),
          hintText: "City Name",
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepOrange),
            borderRadius: BorderRadius.circular(12),)
      ),

    ) ;
  }

  Future<WeatherForecastModel> getWeatherForCity({required String cityName}) => Network().getWeather(CityName: cityName);

}


