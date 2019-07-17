import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey='c4dc74d5fba3d503c7467b7fe3e5f8c0';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude;
  double longitude;

  void getLocationData() async {

    WeatherModel weatherModel = WeatherModel();
    var weatherData= await weatherModel.getLocationWeather();
    Navigator.push(context,MaterialPageRoute(builder: (context){

      return LocationScreen(locationWeather: weatherData,);
    }));

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size:100.0,
        )
      ),
    );
  }
}
