//This class uses the https package to request the api for data using get method.

import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String continent; //Continent of location
  String city;      //Location name for that UI
  String time;      //The time variable to be updated
  bool day=true;
  int temp;
  WorldTime({this.city,this.continent});

  Future<void> getTime() async{
    //making the request by using location data to construct the url for request

    Response response = await get('http://worldtimeapi.org/api/timezone/$continent/$city');//response class is used to get back response.
    Map data = jsonDecode(response.body); //Decodes the response.body json file

    //Getting properties from the decoded json file
    String datetime = data['utc_datetime'];
    String offset = data['utc_offset'];
    int offsetHours = int.parse(offset.substring(1,3));
    int offsetMin= int.parse(offset.substring(4));

    DateTime now = DateTime.parse(datetime);//DateTime class is used to parse a datetime string to DateTime instance
    now = now.add(Duration(
        hours: offsetHours,
        minutes: offsetMin
    ));
    temp = (int.parse(now.toString().substring(11,13)));
    day = (temp>4)&&(temp<19)? true:false;
    time = DateFormat.jm().format(now);
  }
}