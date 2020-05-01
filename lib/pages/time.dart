//This page uses the world time service class and its method
//to get the time of the location passed by choose_ location page

import 'package:world_time_app/services/world_time.dart';
import 'package:flutter/material.dart';
import 'package:world_time_app/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Time extends StatefulWidget {
  final Location location;
  Time({this.location});//location class for the location url
  @override
  _TimeState createState() => _TimeState(location: location);
}

class _TimeState extends State<Time> {

  Location location;
  _TimeState({@required this.location});        //this allows data passing in page
  String time = 'loading';

  void setupWorldTime() async {
    try{
      WorldTime now = WorldTime(continent: location.continent, city: location.city);
      await now.getTime(); //SO that the program waits for the data to receive data
      time = now.time;
      print('returned now....city :${location.city},  conti:${location.continent}, time:$time');

      Navigator.pushNamedAndRemoveUntil(context, '/', (Route<dynamic> route) => false,arguments:{
        'city' : location.city,
        'continent' : location.continent,
        'time' : time,
        'day' : now.day
      } );
    }
    catch(e){
    print('CAUGHT ERROR : $e');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
  }

  @override


  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue[300],
        child: Center(
            child: SpinKitCubeGrid(
              color: Colors.white,
              size: 50.0,
            ),
      )
      )
    );
  }
}


