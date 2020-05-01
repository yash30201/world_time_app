//This page is simply city selector and it passes the location data(location class) to time page


import 'package:flutter/material.dart';
import 'package:world_time_app/location.dart';
import 'package:world_time_app/pages/time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 10.0),
              child: Text(
                'Choose any time zone -',
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ),
            SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0,2.0,2.0,5.0),
              child: FlatButton(
                onPressed: (){
                  Location location = Location(city: 'Kolkata',continent: 'Asia');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context)=> Time(location: location),
                      )
                  );
                },
                color: Colors.amberAccent[200],
                child: Text('Kolkata'),
              ),
            ),
            SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0,2.0,2.0,5.0),
              child: FlatButton(
                onPressed: (){
                  Location location = Location(city: 'Tokyo',continent: 'Asia');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)=> Time(location: location),
                    )
                  );
                },
                color: Colors.amberAccent[200],
                child: Text('Tokyo'),
              ),
            ),
            SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0,2.0,2.0,5.0),
              child: FlatButton(
                onPressed: (){
                  Location location = Location(city: 'London',continent: 'Europe');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context)=> Time(location: location),
                      )
                  );
                },
                color: Colors.amberAccent[200],
                child: Text('London'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
